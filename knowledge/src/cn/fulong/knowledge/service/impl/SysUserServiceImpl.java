package cn.fulong.knowledge.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import cn.fulong.common.service.impl.BaseServiceImpl;
import cn.fulong.entity.IpSysUser;
import cn.fulong.knowledge.service.SysUserService;
import cn.fulong.util.MD5;


@Service("SysUserServiceImpl")
public class SysUserServiceImpl extends BaseServiceImpl implements SysUserService {

	@Override
	public boolean verifySysUser(String username) {
		List<IpSysUser> list=baseTransaction.find("from IpSysUser where userName=?",new Object[]{username});
		if(list.size()==0){
			return false;
		}else{
			return true;
		}
	}

	@Override
	public boolean retrievePassword(String username, String phone) {
		List<IpSysUser> list=baseTransaction.find("from IpSysUser where userName=? and phone=?", new  Object[]{username,phone});
		if(list.size()==0){
			return false;
		}else{
			return true;
		}
	}

	@Override
	public boolean verifyPhone(String phone) {
		List<IpSysUser> list=baseTransaction.find("from IpSysUser where phone=?",new Object[]{phone});
		if(list.size()==0){
			return false;
		}else{
			return true;
		}
	}

	@Override
	public boolean rePassword(String username, String password) {
		List<IpSysUser> list=baseTransaction.find("from IpSysUser where userName=?", new  Object[]{username});
		if(list.size()>0){
			IpSysUser user=list.get(0);
			user.setPassword(MD5.md5s(password));
			baseTransaction.update(user);
			return true;
		}
		return false;
	}

	@Override
	public boolean verifyUserNameAndPass(String username, String phone) {
		List<IpSysUser> list=baseTransaction.find("from IpSysUser where userName=? and phone=?", new  Object[]{username,phone});
		if(list.size()>0){
			return true;
		}
		return false;
	}
	

}
