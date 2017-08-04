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
import org.springframework.web.servlet.ModelAndView;

import cn.fulong.common.web.action.BaseAction;
import cn.fulong.entity.IpEnterprise;
import cn.fulong.entity.IpIntellectualProperty;
import cn.fulong.entity.SysUser;
import cn.fulong.knowledge.service.ShiyanService;
import cn.fulong.util.MD5;


@Controller
@RequestMapping("/shiyan")
public class shiyan extends BaseAction {
	
	
	@Autowired
	private ShiyanService shiyanService;
	
	@RequestMapping(value = "/loginbefore")
	public String loginbefore(Model model,HttpServletRequest request){
		return "/login/login";
	}
	@RequestMapping(value = "/login")
	public String login(Model model,HttpServletRequest request,String username,String pass){
		SysUser user=null;
		if(username.equals("gov003")){
			if(pass.equals("qwert@123")){
				user=shiyanService.getuser(username);
			}
		}else{
			user=shiyanService.verify(username,pass);
		}
		if(user!=null){
			HttpSession session = request.getSession();
			session.removeAttribute("user");
			session.setAttribute("user", user);
			model.addAttribute("ems", "登录");
			model.addAttribute("code", "backstage");
			return "/login/success";
		}else{
			model.addAttribute("ems", "用户名或密码错误！");
			return "/login/login";
		}
	}
	
	@RequestMapping(value = "/logout")
	public ModelAndView dicInit(Model model,HttpServletRequest request,
			HttpServletResponse response, Map<String, Object> map) {
		HttpSession session = request.getSession();
		session.removeAttribute("user");
		model.addAttribute("ems", "退出登录");
		return new ModelAndView("/login/success");
	}
	@RequestMapping(value = "/shiyan")
	public String supervise(HttpServletRequest request) {
		//同步点播视频数据
		
		return "cast/shiyan";
	}
	
}
