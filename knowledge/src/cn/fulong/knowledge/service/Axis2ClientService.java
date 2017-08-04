package cn.fulong.knowledge.service;


import cn.fulong.entity.CpuserBeanResponse;
import cn.fulong.entity.GovuserBeansResponse;
import cn.fulong.entity.PsnUserBeanResponse;
import cn.fulong.entity.UserBeanResponse;
import cn.fulong.entity.SendSmsBeanResponse;

public interface Axis2ClientService {

	/**
	 * 除管理员外其他用户对接方式
	 * @param method
	 * @param objects
	 * @return
	 */
	public UserBeanResponse getResponse(String method, Object... objects);
	
	/**
	 * 管理员对接方式
	 * @param method
	 * @param objects
	 * @return
	 */
	public CpuserBeanResponse getCpuserResponse(String method, Object... objects);
	/**
	 * 发短信
	 * @param method
	 * @param phone
	 * @return
	 */
	public SendSmsBeanResponse getSendSms(String method, String phone);
	
	public PsnUserBeanResponse getPsnResponse(String method, Object... objects);
	
	public GovuserBeansResponse getGovuserResponse(String method, Object... objects);
	
}
