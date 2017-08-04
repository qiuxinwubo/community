package cn.fulong.knowledge.service.impl;


import javax.xml.namespace.QName;

import org.apache.axis2.addressing.EndpointReference;
import org.apache.axis2.client.Options;
import org.apache.axis2.rpc.client.RPCServiceClient;
import org.springframework.stereotype.Repository;

import com.alibaba.fastjson.JSON;

import cn.fulong.entity.CpuserBeanResponse;
import cn.fulong.entity.GovuserBeansResponse;
import cn.fulong.entity.PsnUserBeanResponse;
import cn.fulong.entity.UserBeanResponse;
import cn.fulong.entity.SendSmsBeanResponse;
import cn.fulong.knowledge.service.Axis2ClientService;

@Repository("axis2ClientDaoImpl")
public class Axis2ClientDaoImpl implements Axis2ClientService {

	// 短信
	private String sendSms = "http://www.smebj.cn:9082/hlws/services/SendSmsSrvPub";
	private String isLoginAddress = "http://im.smebj.cn:9090/webservice6/services/Generic";
	private String qnIsLoginAddress = "http://webservice.extsoft.net";
	// 除管理员以外的校验
	private String wsAddress1 = "http://192.166.22.18/hlws/services/ZxjAccountSrvPub";
	// 管理员校验
	private String wsAddress7 = "http://192.166.22.18/hlws/services/ZxjCpuserSrvPub";
	private String qnAddress = "http://service.zxjpt.uuia.nc";
	private String wsAddress8 = "http://192.166.22.18/hlws/services/ZxjGovuserSrvPub";

	private String qnAddress8 = "http://service.zxjpt.uuia.nc";

	public String getIsLogin(String method, Object... objects) {
		RPCServiceClient serviceClient;
		try {
			serviceClient = new RPCServiceClient();
			Options options = serviceClient.getOptions();
			EndpointReference targetEPR = new EndpointReference(isLoginAddress);
			options.setTo(targetEPR);
			options.setAction("urn:" + method);
			QName opAddEntry = new QName(qnIsLoginAddress, method);
			if (objects == null || objects.length == 0) {
				objects = new Object[] {};
			}
			Object results[] = serviceClient.invokeBlocking(opAddEntry, objects, new Class[] { String.class });
			return results[0].toString();
		} catch (Exception e) {
			e.printStackTrace();
			return "false";
		}
	}

	public Object getJsonSendSms(String method, Class<?> returnType, Object... objects) {
		RPCServiceClient serviceClient;
		try {
			serviceClient = new RPCServiceClient();
			Options options = serviceClient.getOptions();
			EndpointReference targetEPR = new EndpointReference(sendSms);
			options.setTo(targetEPR);
			options.setAction("urn:" + method);
			QName opAddEntry = new QName("http://service.zxjpt.uuia.nc", method);
			if (objects == null || objects.length == 0) {
				objects = new Object[] {};
			}
			Object results[] = serviceClient.invokeBlocking(opAddEntry, objects, new Class[] { returnType });
			if (results == null || results[0] == null) {
				return null;
			}
			return returnType.cast(results[0]);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	/**
	 * 发短信
	 */
	public SendSmsBeanResponse getSendSms(String phone, String infocontent) {
		return (SendSmsBeanResponse) getJsonSendSms("sendSms", SendSmsBeanResponse.class, phone, infocontent);
	}

	public String getJsonStr1(String method, Object... objects) {
		RPCServiceClient serviceClient;
		try {
			serviceClient = new RPCServiceClient();
			Options options = serviceClient.getOptions();
			EndpointReference targetEPR = new EndpointReference(wsAddress1);
			options.setTo(targetEPR);
			options.setAction("urn:" + method);
			QName opAddEntry = new QName(qnAddress, method);
			if (objects == null || objects.length == 0) {
				objects = new Object[] {};
			}
			Object results[] = serviceClient.invokeBlocking(opAddEntry, objects, new Class[] { String.class });
			if (results == null || results[0] == null) {
				return "";
			}
			return results[0].toString();
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}
	}

	public UserBeanResponse jsonStr2UserResp(String jsonStr) {
		return JSON.parseObject(jsonStr.substring(1, jsonStr.length() - 1), UserBeanResponse.class);
	}

	public UserBeanResponse getResponse(String method, Object... objects) {
		return jsonStr2UserResp(getJsonStr1(method, objects));
	}

	public String getJsonStr7(String method, Object... objects) {
		RPCServiceClient serviceClient;
		try {
			serviceClient = new RPCServiceClient();
			Options options = serviceClient.getOptions();
			EndpointReference targetEPR = new EndpointReference(wsAddress7);
			options.setTo(targetEPR);
			options.setAction("urn:" + method);
			QName opAddEntry = new QName(qnAddress, method);
			if (objects == null || objects.length == 0) {
				objects = new Object[] {};
			}
			Object results[] = serviceClient.invokeBlocking(opAddEntry, objects, new Class[] { String.class });
			if (results == null || results[0] == null) {
				return "";
			}
			return results[0].toString();
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}
	}

	public GovuserBeansResponse getGovuserResponse(String method, Object... objects) {
		return jsonStr2GovuserResp(getJsonStr8(method, objects));
	}

	public String getJsonStr8(String method, Object... objects) {
		RPCServiceClient serviceClient;
		try {
			serviceClient = new RPCServiceClient();
			Options options = serviceClient.getOptions();
			EndpointReference targetEPR = new EndpointReference(wsAddress8);
			options.setTo(targetEPR);
			options.setAction("urn:" + method);
			QName opAddEntry = new QName(qnAddress8, method);
			if (objects == null || objects.length == 0) {
				objects = new Object[] {};
			}
			Object results[] = serviceClient.invokeBlocking(opAddEntry, objects, new Class[] { String.class });
			if (results == null || results[0] == null) {
				return "";
			}
			return results[0].toString();
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}
	}

	private GovuserBeansResponse jsonStr2GovuserResp(String jsonStr) {
		return JSON.parseObject(jsonStr.substring(1, jsonStr.length() - 1), GovuserBeansResponse.class);
	}

	public PsnUserBeanResponse getPsnResponse(String method, Object... objects) {
		return jsonStr2PsnUserResp(getJsonStr1(method, objects));
	}

	public PsnUserBeanResponse jsonStr2PsnUserResp(String jsonStr) {
		return JSON.parseObject(jsonStr.substring(1, jsonStr.length() - 1), PsnUserBeanResponse.class);
	}

	public CpuserBeanResponse getCpuserResponse(String method, Object... objects) {
		return jsonStr2CpuserResp(getJsonStr7(method, objects));
	}

	private CpuserBeanResponse jsonStr2CpuserResp(String jsonStr) {
		return JSON.parseObject(jsonStr.substring(1, jsonStr.length() - 1), CpuserBeanResponse.class);
	}

}
