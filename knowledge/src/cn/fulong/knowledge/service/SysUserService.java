package cn.fulong.knowledge.service;

import cn.fulong.common.service.BaseService;

public interface SysUserService extends BaseService {

	boolean verifySysUser(String username);

	boolean retrievePassword(String username, String phone);

	boolean verifyPhone(String phone);

	boolean rePassword(String username, String password);

	boolean verifyUserNameAndPass(String username, String phone);

}
