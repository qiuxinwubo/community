package cn.fulong.knowledge.service;


import cn.fulong.entity.SysUser;

public interface DataGatherService {
	public SysUser syncUserByAcAndSid(String username, String sessionId,String usertype);
}
