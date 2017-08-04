package cn.fulong.knowledge.web.action;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.fulong.common.web.action.BaseAction;
import cn.fulong.entity.IpSysUser;
import cn.fulong.entity.SysUser;
import cn.fulong.knowledge.service.FrameService;


@Controller
@RequestMapping("/frame")
public class FrameAction extends BaseAction{
	@Resource(name="frameServiceImpl")
	private FrameService frameService;
	
	/**
	 * frame
	 */
	@RequestMapping(value="/frame")
	public String frame(Model model,HttpServletRequest request){
		HttpSession session =request.getSession();
		IpSysUser user=(IpSysUser) session.getAttribute("user");
		model.addAttribute("user",user);
		return "/frame/frame";
	}
	
	/**
	 * 头部
	 */
	@RequestMapping(value="/show_top_bar")
	public String top(Model model,HttpServletRequest request){
		
		HttpSession session =request.getSession();
		IpSysUser user=(IpSysUser) session.getAttribute("user");
		model.addAttribute("user",user);
		return "/frame/show_top_bar";
	}
	/**
	 * 前台头部
	 */
	@RequestMapping(value="/show_top_index")
	public String topIndex(Model model,HttpServletRequest request){
		HttpSession session =request.getSession();
		IpSysUser user=(IpSysUser) session.getAttribute("user");
		model.addAttribute("user",user);
		return "/frame/show_top_index";
	}
	/**
	 * 左侧列表
	 */
	@RequestMapping(value="/show_menu")
	public String menu(Model model,HttpServletRequest request){
		HttpSession session =request.getSession();
//		SysUser user=(SysUser) session.getAttribute("user");
//		int roleCode = user.getRoleCode();
//		model.addAttribute("roleCode", roleCode);
		model.addAttribute("roleCode", "1");
		return "/frame/menu";
	}
	/**
	 * 底部
	 */
	@RequestMapping(value="/show_default")
	public String showdefault(){
		return "/frame/show_default";
	}
	/**
	 * 前台底部
	 */
	@RequestMapping(value="/show_default_index")
	public String showdefaultIndex(){
		return "/frame/show_default_index";
	}
	/**
	 * 前台图片链接
	 */
	@RequestMapping(value="/show_image_href")
	public String showImageHref(){
		return "/frame/image_href";
	}
	
	/**
	 * 首页跳转
	 */
	@RequestMapping(value="/showIndex")
	public String showIndex(){
		return "/frame/show_index";
	}
	
}
