package cn.fulong.knowledge.service.impl;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.stereotype.Service;

import cn.fulong.common.service.impl.BaseServiceImpl;
import cn.fulong.entity.IpSysUser;
import cn.fulong.entity.SysUser;
import cn.fulong.knowledge.service.LoginIpService;
import cn.fulong.util.MD5;


@Service("LoginIpServiceImpl")
public class LoginIpServiceImpl extends BaseServiceImpl implements LoginIpService {

	@Override
	public IpSysUser verify(String username, String pass) {
		// TODO Auto-generated method stub
		pass=MD5.md5s(pass);
		List<IpSysUser> list=baseTransaction.find("from IpSysUser where (userName=? or phone=?) and password=?", new String[]{username,username,pass});;
		if(list.size()==0){
			return null;
		}
		IpSysUser sysUser=list.get(0);
		return sysUser;
	}

	@Override
	public IpSysUser getuser(String username) {
		List<IpSysUser> list=baseTransaction.find("from IpSysUser where userName=?", new String[]{username});;
		if(list.size()==0){
			return null;
		}
		IpSysUser sysUser=list.get(0);
		return sysUser;
	}

	@Override
	public IpSysUser saveSysUser(String username, String pass,String phone) {
		IpSysUser user=new IpSysUser();
		user.setUserName(username);
		user.setPassword(MD5.md5s(pass));
		Timestamp time=new Timestamp(System.currentTimeMillis());
		user.setLastLoginTime(time);
		user.setLoginTime(time);
		user.setPhone(phone);
		user.setIfNature("3");
		List<SysUser> list=baseTransaction.find("from SysUser where username=?",new                                                               Object[]{username});
		if(list.size()>0){
			user.setIfExist("1");
		}else{
			user.setIfExist("0");
		}
		baseTransaction.save(user);
		return user;
	}

	@Override
	public IpSysUser update(String id) {
		IpSysUser user=(IpSysUser) baseTransaction.get(IpSysUser.class, id);
		user.setLastLoginTime(user.getLoginTime());
		Timestamp time=new Timestamp(System.currentTimeMillis());
		user.setLoginTime(time);
		baseTransaction.update(user);
		return user;
	}

}
