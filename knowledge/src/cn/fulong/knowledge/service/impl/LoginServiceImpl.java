package cn.fulong.knowledge.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import cn.fulong.common.service.impl.BaseServiceImpl;
import cn.fulong.entity.SysUser;
import cn.fulong.toolkit.util.Encrypt;
import cn.fulong.knowledge.service.LoginService;

@Service
public class LoginServiceImpl extends BaseServiceImpl implements LoginService{

	@SuppressWarnings("unchecked")
	public SysUser login(String userName, String password) {
//		String pw=Encrypt.MD5(userName+password);
		List<SysUser> userList =  baseTransaction.find("from SysUser where username=? and password=? and flag = '1'", new String[]{userName, password});
		if(userList.size() == 0) {
			return null;
		}
		SysUser user = userList.get(0);
		return user;
		
	}

	public void logout() {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder
				.getRequestAttributes()).getRequest();
		HttpSession session = request.getSession();
		session.removeAttribute("user");
		session.removeAttribute("authusercode");
	}

}
