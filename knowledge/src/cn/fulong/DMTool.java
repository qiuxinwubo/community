package cn.fulong;

import java.io.File;
import java.io.FileWriter;
import java.sql.SQLException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

import freemarker.template.Configuration;
import freemarker.template.DefaultObjectWrapper;
import freemarker.template.Template;

public class DMTool {
	public static String Template_Path = "/Users/lin/workspace/bj/vms/src/cn/fulong/";
	public static String Template_File = "java.ftl";
	public static String File_Path = "/Users/lin/workspace/bj/vms/src/cn/fulong/entity/";
	public static String Package_Name = "cn.fulong.entity";

	private DriverManagerDataSource dataSource;
	private JdbcTemplate jdbcTemplate;

	public void init() {
		dataSource = new DriverManagerDataSource();
		dataSource.setDriverClassName("oracle.jdbc.driver.OracleDriver");
		dataSource.setUrl("jdbc:oracle:thin:@192.168.0.88:1521:orclgbk");
		dataSource.setUsername("beijing");
		dataSource.setPassword("fulong");


		jdbcTemplate = new JdbcTemplate();
		jdbcTemplate.setDataSource(dataSource);
	}

	@SuppressWarnings("unchecked")
	public Map getData(String tableName) {
		Map data = new HashMap();
		data.put("tableName", tableName);
		data.put("packageName", Package_Name);

		Map table = jdbcTemplate.queryForMap("select class_name from V_FRAME_TABLE where table_name=?", tableName);
		if (table == null || table.size() < 1) {
			return null;
		}
		data.put("className", (String) table.get("class_name"));

		List propertyList = jdbcTemplate.queryForList(
				"select * from V_FRAME_COLUMN where table_name=? and if_primary_key=0 order by column_seq", tableName);
		if (propertyList == null || propertyList.size() < 1) {
			return null;
		}
		data.put("propertyList", propertyList);

		List keyList = jdbcTemplate.queryForList(
				"select * from V_FRAME_COLUMN where table_name=? and if_primary_key=1 order by column_seq", tableName);
		data.put("keyList", keyList);

		if (keyList != null && keyList.size() > 1) {
			data.put("ifCompositeKey", "1");
		} else {
			data.put("ifCompositeKey", "0");
		}
		return data;
	}

	public void createFile(Object data, String file) {
		try {
			Configuration cfg = new Configuration();
			cfg.setDirectoryForTemplateLoading(new File(Template_Path));
			cfg.setEncoding(Locale.getDefault(), "UTF-8");
			cfg.setObjectWrapper(new DefaultObjectWrapper());

			Template temp = cfg.getTemplate(Template_File);
			FileWriter fw = new FileWriter(File_Path + file);
			temp.process(data, fw);
			fw.flush();
			fw.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@SuppressWarnings("unchecked")
	public void doOne(String tableName) {
		Map table = getData(tableName);
		createFile(table, table.get("className") + ".java");
	}

	@SuppressWarnings("unchecked")
	public void doAll() {
		List list = jdbcTemplate.queryForList("select * from V_FRAME_TABLE order by table_name");
		if (list == null || list.size() < 1) {
			return;
		}
		for (int i = 0; i < list.size(); i++) {
			Map table = (Map) list.get(i);
			String tableName = (String) table.get("TABLE_NAME");
			System.out.println(tableName + " doing...");
			doOne(tableName);
		}
	}

	public void doAll(String doTableName) {
		List list = 
			jdbcTemplate.queryForList("select * from V_FRAME_TABLE where table_name='" + doTableName + "' order by table_name");
		if (list == null || list.size() < 1) {
			return;
		}
		for (int i = 0; i < list.size(); i++) {
			Map table = (Map) list.get(i);
			String tableName = (String) table.get("TABLE_NAME");
			System.out.println(tableName + " doing...");
			doOne(tableName);
		}
	}

	public static void main(String[] args) throws SQLException {
		Date begin = new Date();
		System.out.println("Begin.");

		DMTool tool = new DMTool();
		tool.init();

		tool.doAll("COMMON_WINDOW");
		//tool.doAll();
		
		Date end = new Date();
		long time = end.getTime() - begin.getTime();
		System.out.println("End.Used time:" + ((double) time / 1000) + "s.");
	}

}
