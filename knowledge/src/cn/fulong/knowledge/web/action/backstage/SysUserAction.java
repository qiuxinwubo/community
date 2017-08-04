package cn.fulong.knowledge.web.action.backstage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.fulong.common.web.action.BaseAction;
import cn.fulong.entity.IpEnterprise;
import cn.fulong.entity.IpIntellectualProperty;
import cn.fulong.entity.IpSysUser;
import cn.fulong.knowledge.service.SysUserService;


@Controller
@RequestMapping("/sysuseraction")
public class SysUserAction extends BaseAction {
	
	@Autowired
	private SysUserService sysUserService;
	/**
	 * @author 张承冰
	 * @time 2017-4-26
	 * 校验用户名是否存在
	 */
	@ResponseBody
	@RequestMapping(value="/verifysysuser")
	public String verifySysUser(Model model,HttpServletRequest request,String username){
		boolean sgin=sysUserService.verifySysUser(username);
		if(sgin){
			return "1";
		}else{
			return "0";
		}
	}
	/**
	 * @author 张承冰
	 * @time 2017-4-26
	 * 校验手机号是否存在
	 */
	@ResponseBody
	@RequestMapping(value="/verifyphone")
	public String verifyPhone(Model model,HttpServletRequest request,String phone){
		boolean sgin=sysUserService.verifyPhone(phone);
		if(sgin){
			return "1";
		}else{
			return "0";
		}
	}
	/**
	 * @author 张承冰
	 * @time 2017-4-26
	 * 重置密码前的跳转
	 */
	@RequestMapping(value="/repasswordbefore")
	public String rePasswordBefore(Model model,HttpServletRequest request){
		return "/login/reset_password1";
	}
	/**
	 * @author 张承冰
	 * @time 2017-4-26
	 * 重置密码前用户名和手机号校验
	 */
	@ResponseBody
	@RequestMapping(value="/verifyusernameandpass")
	public String verifyUserNameAndPass(Model model,HttpServletRequest request,String username,String phone){
		boolean sgin=sysUserService.verifyUserNameAndPass(username,phone);
		if(sgin){
			return "1";
		}else{
			return "0";
		}
	}
	/**
	 * @author 张承冰
	 * @time 2017-4-26
	 * 重置密码用户名和手机号校验
	 */
	@RequestMapping(value="/retrievepassword")
	public String retrievePassword(Model model,HttpServletRequest request,String username,String phone){
		boolean sgin=sysUserService.retrievePassword(username,phone);
		if(sgin){
			model.addAttribute("username", username);
			model.addAttribute("phone", phone);
			return "/login/reset_password2";
		}else{
			model.addAttribute("ems", "跳转");
			model.addAttribute("code", "re_index");
			return "/login/defeated";
		}
	}
	/**
	 * @author 张承冰
	 * @time 2017-4-26
	 * 重置密码
	 */
	@RequestMapping(value="/repassword")
	public String rePassword(Model model,HttpServletRequest request,String username,String password){
		boolean sgin=sysUserService.rePassword(username,password);
		model.addAttribute("ems", "重置密码");
		model.addAttribute("code", "re_index");
		if(sgin){
			return "/login/success";
		}else{
			return "/login/defeated";
		}
	}
}
