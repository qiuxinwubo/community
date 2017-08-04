package cn.fulong.knowledge.service.impl;


import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import cn.fulong.common.service.impl.BaseServiceImpl;
import cn.fulong.entity.GovuserBeansResponse;
import cn.fulong.entity.PsnUserBeanResponse;
import cn.fulong.entity.SysUser;
import cn.fulong.entity.UserBeanResponse;
import cn.fulong.knowledge.service.Axis2ClientService;
import cn.fulong.knowledge.service.DataGatherService;

@Service("dataGatherServiceImpl")
public class DataGatherServiceImpl extends BaseServiceImpl implements DataGatherService {
	@Resource(name = "axis2ClientDaoImpl")
	private Axis2ClientService axis2Client;


	public SysUser syncUserByAcAndSid(String username, String sessionId, String usertype) {
		try {
			GovuserBeansResponse cpuserBeanResponse = axis2Client.getGovuserResponse("getGovuserByAcAndSid",
					new Object[] { username, sessionId });
			if (StringUtils.isNotBlank(cpuserBeanResponse.getSuccess())
					&& "1".equals(cpuserBeanResponse.getSuccess())) {
				SysUser sysuser = getUserInfo(username, usertype);
				if (sysuser!=null) {
					return sysuser;
				}
			} else {
				System.out.println("gov用户校验:"+cpuserBeanResponse.getMessage()); 
			}
			
			UserBeanResponse userBeanResponse = axis2Client.getResponse("getEnterpriseUserByAcAndSid",
					new Object[] { username, sessionId });
			if (StringUtils.isNotBlank(userBeanResponse.getSuccess()) && "1".equals(userBeanResponse.getSuccess())) {
				SysUser sysuser = getUserInfo(username, usertype);
				if (sysuser!=null) {
					return sysuser;
				}
			} else {
				System.out.println("机构企业用户校验:"+userBeanResponse.getMessage());
			}

			PsnUserBeanResponse psnUserBeanResponse = axis2Client.getPsnResponse("getPsnUserByAcAndSid",
					new Object[] { username, sessionId });
			if (StringUtils.isNotBlank(psnUserBeanResponse.getSuccess())
					&& "1".equals(psnUserBeanResponse.getSuccess())) {
				SysUser sysuser = getUserInfo(username, usertype);
				if (sysuser!=null) {
					return sysuser;
				}
			} else {
				System.out.println("个人等用户校验:"+psnUserBeanResponse.getMessage()); 
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public SysUser getUserInfo(String username, String usertype) {
		SysUser sysuser = (SysUser) baseTransaction.find("from SysUser where username=? and roleCode=?", new Object[] { username, Integer.parseInt(usertype)});
//		List<SysUser> userList = baseDao.find("from SysUser where username=? and roleCode=?", new String[] { username, usertype});
//		if (userList != null && userList.size() > 0) {
//			return userList.get(0);
//		}
		return sysuser;
	}
}
