package cn.fulong.knowledge.web.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.fulong.common.web.action.BaseAction;
import cn.fulong.entity.IpEnterprise;
import cn.fulong.entity.IpIntellectualProperty;
import cn.fulong.entity.IpSysUser;
import cn.fulong.entity.SysUser;
import cn.fulong.knowledge.service.LoginIpService;
import cn.fulong.util.MD5;


@Controller
@RequestMapping("/LoginIpAction")
public class LoginIpAction extends BaseAction {
	
	
	@Autowired
	private LoginIpService LoginIpService;
	
	@RequestMapping(value = "/loginbefore")
	public String loginbefore(Model model,HttpServletRequest request,String url){
		if(url!=null){
			HttpSession session=request.getSession();
			session.removeAttribute("url");
			session.setAttribute("url", url);
		}
		return "/login/login";
	}
	@RequestMapping(value = "/login")
	public String login(Model model,HttpServletRequest request,String username,String pass){
		IpSysUser user=null;
		user=LoginIpService.verify(username,pass);
		if(user!=null){
			user=LoginIpService.update(user.getId());
		}else{
			model.addAttribute("username", username);
			model.addAttribute("pass", pass);
			model.addAttribute("ems", "用户名或密码错误！");
			return "/login/login";
		}
		HttpSession session = request.getSession();
		session.removeAttribute("user");
		session.setAttribute("user", user);
		String url=(String) session.getAttribute("url");
		model.addAttribute("ems", "登录");
		model.addAttribute("url",url);
		return "/login/success";
	}
	@ResponseBody
	@RequestMapping(value = "/verifyNature")
	public String verifyNature(Model model,HttpServletRequest request) {
		HttpSession session = request.getSession();
		IpSysUser user=(IpSysUser) session.getAttribute("user");
		if(user.getIfNature().equals("3")){
			return "1";
		}else{
			return "0";
		}
	}
	@RequestMapping(value = "/logout")
	public ModelAndView dicInit(Model model,HttpServletRequest request,
			HttpServletResponse response, Map<String, Object> map) {
		HttpSession session = request.getSession();
		session.removeAttribute("user");
		session.removeAttribute("url");
		model.addAttribute("ems", "退出登录");
		model.addAttribute("code", "re_index");
		return new ModelAndView("/login/success");
	}
	@RequestMapping(value = "/registerbefore")
	public String registerbefore(Model model,HttpServletRequest request){
		return "/login/register";
	}
	@RequestMapping(value = "/register")
	public String register(Model model,HttpServletRequest request,String username,String pass,String phone){
		IpSysUser user=null;
		user=LoginIpService.saveSysUser(username,pass,phone);
		HttpSession session = request.getSession();
		session.removeAttribute("user");
		session.setAttribute("user", user);
		model.addAttribute("ems", "注册");
		model.addAttribute("code", "re_index");
		return "/login/success";
	}
}
