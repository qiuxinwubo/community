package cn.fulong.knowledge.web.action.reception;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.jms.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.fulong.common.web.action.BaseAction;
import cn.fulong.entity.IpSkipRecord;
import cn.fulong.entity.IpSysUser;
import cn.fulong.frame.service.ShowService;
import cn.fulong.knowledge.service.ReceptionService;

@Controller
@RequestMapping("/receptionaction")
public class ReceptionAction extends BaseAction {
	
	
	@Autowired
	private ReceptionService receptionService;
	@Autowired
	private ShowService showService;
	
	/**
	 * @author 石鑫鑫
	 * @time 2017-4-20
	 * 判断用户是否登陆
	 */
	@ResponseBody
	@RequestMapping(value="/islogin")
	public String isLogin(HttpServletRequest request){
		HttpSession session =request.getSession();
		IpSysUser user=(IpSysUser) session.getAttribute("user");
		String fl = "0";
		String phone =null;
		if(user!=null){
			fl = "1";
			phone = user.getPhone();
		}
		String result  = "{\"flag\":"+fl+",\"phone\":"+phone+"}";
		return result;
	}
	/**
	 * @author 张承冰
	 * @time 2017-4-21
	 * 判断用户是否登陆
	 */
	@ResponseBody
	@RequestMapping(value="/reislogin")
	public Map<String,String> reIsLogin(HttpServletRequest request){
		HttpSession session =request.getSession();
		IpSysUser user=(IpSysUser) session.getAttribute("user");
		String fl = "0";
		String phone =null;
		if(user!=null){
			fl = "1";
			phone = user.getPhone();
		}
		Map<String,String> map=new HashMap<String,String>();
		map.put("flag",fl);
		map.put("phone",phone);
		return map;
	}
	/**
	 * @author 石鑫鑫
	 * @time 2017-4-20
	 * 获取咨询链接
	 */
	@ResponseBody
	@RequestMapping(value="/getchaturl")
	public String getChatUrl(HttpServletRequest request,String entId){
		String url = receptionService.getChatUrl(entId);
		return url;
	}
	/**
	 * @author 石鑫鑫
	 * @time 2017-4-20
	 * 保存跳转记录
	 */
	@ResponseBody
	@RequestMapping(value="/saveskiprecord")
	public String saveSkipRecord(HttpServletRequest request,IpSkipRecord record){
		HttpSession session=request.getSession();
		IpSysUser user =  (IpSysUser) session.getAttribute("user");
		record.setUserId(user.getId());
		boolean fl = receptionService.saveSkipRecord(record);
		return fl?"1":"0";
	}
	/**
	 * @author 石鑫鑫
	 * @time 2017-4-20
	 * 保存留言
	 */
	@ResponseBody
	@RequestMapping(value="/saveleaveword")
	public String saveLeaveWord(Model model,HttpServletRequest request,String content){
		HttpSession session=request.getSession();
		IpSysUser user=(IpSysUser) session.getAttribute("user");
		receptionService.saveLeaveWord(content,user);
		model.addAttribute("code", "re_index");
		return "1";
	}
	/**
	 * @author 张承冰
	 * @time 2017-4-21
	 * 新闻或产品案例列表页
	 */
	@RequestMapping(value="/newsorcaselist")
	public String newsOrCaseList(Model model,HttpServletRequest request,String code){
		return "/reception/"+code;
	}
	/**
	 * @author 张承冰
	 * @time 2017-4-21
	 * 新闻或产品案例详情页
	 */
	@RequestMapping(value="/newsorcasedetail")
	public String newsOrCaseDetail(Model model,HttpServletRequest request,String code,String id){
		model.addAttribute("id", id);
		return "/reception/"+code;
	}
	/**
	 * @author 张承冰
	 * @throws Exception 
	 * @time 2017-4-21
	 * 前台显示show方法
	 */
	@RequestMapping(value="/show")
	public String show(String code, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception{
		Enumeration paramNames = request.getParameterNames();
		Map<String, String> args = new HashMap();
		while (paramNames.hasMoreElements()) {
		       String name = (String)paramNames.nextElement();
		       String vname = request.getParameter(name);
		       args.put(name, vname);
		     }
		model.addAttribute("args", args);
		
		Map data = new HashMap();
		data = this.showService.getPageData(code, args);
		model.addAttribute("data", data);
		
		if ((data == null) || (data.size() == 0)) {
		  return "error";
		}
		String url = (String)data.get("url");
		return url;
	}
	
}
