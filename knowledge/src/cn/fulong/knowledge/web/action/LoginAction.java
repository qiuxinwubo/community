package cn.fulong.knowledge.web.action;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cn.fulong.common.web.action.BaseAction;
import cn.fulong.entity.SysUser;
import cn.fulong.knowledge.service.LoginService;

@Controller
@RequestMapping("/login")
public class LoginAction extends BaseAction{

	@Autowired
	private LoginService loginService;

	@RequestMapping(value = "/login")
	public ModelAndView dicInit(HttpServletRequest request, HttpServletResponse response, String userName, String password,
			Map<String, Object> map) {
		map.put("userName", userName);
		
		if (StringUtils.isBlank(userName) || StringUtils.isBlank(password)) {
			return new ModelAndView("/index/login", "error", "请输入用户名或密码");
		} else {
			SysUser user = loginService.login(userName, password);
			if(user == null)
				return new ModelAndView("/index/login", "error", "用户名或密码错误");
			else
				this.saveUser(user);
				HttpSession session = request.getSession();
				session.removeAttribute("user");
//				session.removeAttribute("authusercode");
				session.setAttribute("user", user);
//				session.setAttribute("authusercode", user.getRoleCode().toString());
				String roleCode = user.getBelongorgType();
				String url = null;
				if(roleCode == "6"){
					url = "show.action?code=list_live";
				}else{
					url = "show.action?code=list_live";
				}
				return new ModelAndView("/index/frame", "url", url);
		}
	}
	
	@RequestMapping(value = "/logout")
	public ModelAndView dicInit(HttpServletRequest request,
			HttpServletResponse response, Map<String, Object> map) {
		loginService.logout();
		return new ModelAndView("/index/login");
	}
}
