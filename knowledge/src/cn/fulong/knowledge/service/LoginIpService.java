package cn.fulong.knowledge.service;

import cn.fulong.common.service.BaseService;
import cn.fulong.entity.IpSysUser;
import cn.fulong.entity.SysUser;

public interface LoginIpService extends BaseService {

	IpSysUser verify(String username, String pass);

	IpSysUser getuser(String username);

	IpSysUser saveSysUser(String username, String pass,String phone);

	IpSysUser update(String id);

}
