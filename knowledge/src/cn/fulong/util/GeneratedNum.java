package cn.fulong.util;

import java.util.Calendar;


import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;

import cn.fulong.frame.config.ConfigDic;

/**
 * 编号生成
 * 
 * @author tff
 * 改版wyp
 *
 */
public class GeneratedNum {

	private GeneratedNum() { }

	private static GeneratedNum generatedNum = null;

	public synchronized static GeneratedNum getInstance() {
		if (generatedNum == null) {
			generatedNum = new GeneratedNum();
		}

		return generatedNum;
	}

	private static JdbcTemplate jdbcTemp;

	public static JdbcTemplate getJdbcTemplate() {
		WebApplicationContext wac = ContextLoader
				.getCurrentWebApplicationContext();
		if (jdbcTemp == null) {
			jdbcTemp = (JdbcTemplate) wac.getBean("jdbcTemplate");
		}

		return jdbcTemp;
	}
	
	/**
	 * 获取订单编号
	 * 1位标识符+(10位时间戳+自增长数后的一个数字 疊加)
	 * 
	 * @param length
	 *            编号总长度 11
	 * @param code
	 *            编号对应code值 ORDER_NUM
	 * @return
	 */
	public String getOrderNum(int length, String code){
		//获取当前年
		int year = Calendar.getInstance().get(Calendar.YEAR); 
		//获取年对应的值  2016-1 2017-2 2018-3 ......
		String value = ConfigDic.getInstance().getNameFromDic("EcDicYear", String.valueOf(year));
		int firstNum = Integer.parseInt(value);
		//获取时间戳 13位
		long time = System.currentTimeMillis();
		//获取自增长数
		int nextVal = this.getNextval(code);
		//时间戳+自增长数 然后截取+拼接
		String temp = String.valueOf(time + (long)nextVal);
		temp = firstNum + temp.substring(temp.length()-length+firstNum);
		return temp;
	}
	
	/**
	 * 获取非固定长度编号  除了订单号 以外的其他编号
	 * 比如：结算编号、退款编号、商品编号、商家编号
	 * 
	 * @param length
	 *            编号总长度
	 * @param code
	 *            编号对应code值
	 * @return
	 */
	public String getNumber(int length, String code) {
		
		//获取时间戳 13位
		long time = System.currentTimeMillis();
		//获取自增长数
		int nextVal = this.getNextval(code);
		
		//时间戳+自增长数 然后截取+拼接
		String temp = String.valueOf(time + (long)nextVal);
		temp = temp.substring(temp.length()-length);
		
		return temp;
	}
	
	/**
	 * 获取自增长数的下一个值
	 * @param code 
	 * @return
	 */
	private Integer getNextval(String code){
		// 查询下一个值
		String nextval_sql = "SELECT NEXTVAL('" + code + "')";
		Integer nextval = getJdbcTemplate().queryForInt(nextval_sql);
		return nextval;
	}
}