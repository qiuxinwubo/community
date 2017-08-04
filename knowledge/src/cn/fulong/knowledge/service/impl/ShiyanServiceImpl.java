package cn.fulong.knowledge.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import cn.fulong.common.service.impl.BaseServiceImpl;
import cn.fulong.entity.SysUser;
import cn.fulong.knowledge.service.ShiyanService;


@Service("ShiyanServiceImpl")
public class ShiyanServiceImpl extends BaseServiceImpl implements ShiyanService {

	@Override
	public SysUser verify(String username, String pass) {
		// TODO Auto-generated method stub
		
		List<SysUser> list=baseTransaction.find("from SysUser where username=? and password=?", new String[]{username, pass});;
		if(list.size()==0){
			return null;
		}
		SysUser sysUser=list.get(0);
		return sysUser;
	}

	@Override
	public SysUser getuser(String username) {
		List<SysUser> list=baseTransaction.find("from SysUser where username=?", new String[]{username});;
		if(list.size()==0){
			return null;
		}
		SysUser sysUser=list.get(0);
		return sysUser;
	}

}
