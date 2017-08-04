package cn.fulong.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.protocol.HTTP;
import org.apache.http.util.EntityUtils;

/**
 * 统一的httpClient发送器
 * @author ANG
 *
 */
public class WebcastJsonUtil {
	
//	//测试接口地址前半段（已停用）
//	private static final String usuallyUrl = "http://xiaoanyun.wepvision.com/integration/site";
//	//测试用户名-管理员（已停用）
//	private static final String loginName = "admin@xiaoanyun.com";
//	//测试密码-管理员（已停用）
//	private static final String password = "xiaoanyun";
	
	//接口地址前半段
	private static final String usuallyUrl = "http://live.smebj.cn/integration/site";
	//用户名-管理员
	private static final String loginName = "admin@smebj.com";
	//密码-管理员
	private static final String password = "888888";
	
	/**
	 * 新增直播
	 */
	public static final String LiveAdd = "/webcast/created";
	/**
	 * 新增直播
	 */
	public static final String LiveDel = "/webcast/deleted";
	/**
	 * 同步点播数据
	 */
	public static final String CastList = "/webcast/vod/sync";
	/**
	 * 修改直播
	 */
	public static final String LiveUpdate = "/webcast/update";
	
	/**
	 * 通过一个httpClient程序访问接口
	 * @param map  不同的接口需要的参数（out of username and password）
	 * @param siteName 接口名称（文档中的接口路径）
	 * @return jsonString
	 */
	public static String httpClientCall(Map<String, Object> map,String siteName) throws Exception{
		//需要返回的json串
		String StringJson = "";
		//向map中默认添加username和password
		map.put("loginName", loginName);
		map.put("password", password);
		//定义httpClient的实例
		HttpPost httppost=new HttpPost(usuallyUrl+siteName);
		//建立NameValuePair数组
		List<NameValuePair> params=new ArrayList<NameValuePair>();
		//循环map获得将参数插入params
		for (Map.Entry<String, Object> m : map.entrySet())  {
			params.add(new BasicNameValuePair(m.getKey().toString(), m.getValue().toString()));
        }
		//设置编码格式
		httppost.setEntity(new UrlEncodedFormEntity(params,HTTP.UTF_8));
		//发送post请求并返回一个httpResponse对象
		HttpResponse response=new DefaultHttpClient().execute(httppost);
		//如果状态码为200,就是正常返回
		if(response.getStatusLine().getStatusCode()==200){
			//得到返回的字符串
			StringJson=EntityUtils.toString(response.getEntity());
		}else{
			StringJson = response.getStatusLine().getStatusCode()+"";
		}
		return StringJson;
	}
	

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("pageNo", "1");
		map.put("startTime", "2016-09-01 00:00:00");
		map.put("endTime", "2016-09-28 00:00:00");
		try {
			String jsonString = WebcastJsonUtil.httpClientCall(map, "/webcast/vod/sync");
			System.out.println(jsonString);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
