package cn.fulong.knowledge.service;

import cn.fulong.common.service.BaseService;
import cn.fulong.entity.SysUser;

public interface LoginService extends BaseService{

	SysUser login(String username,String password);
	
	void logout();
}
