package cn.fulong.knowledge.web.action.backstage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.fulong.common.web.action.BaseAction;
import cn.fulong.entity.IpAdvertisement;
import cn.fulong.entity.IpEnterprise;
import cn.fulong.entity.IpImageUpload;
import cn.fulong.entity.IpIntellectualProperty;
import cn.fulong.entity.IpSysUser;
import cn.fulong.entity.SysUser;
import cn.fulong.knowledge.service.BackstageMerchantService;


@Controller
@RequestMapping("/backstagemerchant")
public class BackstageMerchantAction extends BaseAction {
	
	
	@Autowired
	private BackstageMerchantService backstageMerchantService;
	/**
	 * @author 张承冰
	 * @time 2017-4-12
	 * 新增产品之前的查询
	 */
	@RequestMapping(value="/baproductadd")
	public String baproductadd(Model model,HttpServletRequest request){
		IpIntellectualProperty intellectualProperty=new  IpIntellectualProperty();
		List<IpEnterprise> entList=backstageMerchantService.getEntList();
		model.addAttribute("entList", entList);
		model.addAttribute("sign", "1");
		model.addAttribute("intellectualProperty", intellectualProperty);
		return "/backstage/ba_product_new";
	}
	/**
	 * @author 张承冰
	 * @time 2017-4-19
	 * 修改产品之前的查询
	 */
	@RequestMapping(value="/baproductalter")
	public String baproductalter(Model model,HttpServletRequest request,String id){
		IpIntellectualProperty intellectualProperty=backstageMerchantService.getIpIntellectualProperty(id);
		List<IpEnterprise> entList=backstageMerchantService.getEntList();
		model.addAttribute("entList", entList);
		model.addAttribute("sign", "2");
		model.addAttribute("intellectualProperty", intellectualProperty);
		IpImageUpload ipImageUpload=backstageMerchantService.getIpImageUpload(intellectualProperty.getImage());
		if(ipImageUpload==null){
			model.addAttribute("imageurl", "");
		}else{
			model.addAttribute("imageurl", ipImageUpload.getImageUrl());
		}
		return "/backstage/ba_product_new";
	}
	/**
	 * @author 张承冰
	 * @time 2017-4-12
	 * 新增产品保存
	 */
	@RequestMapping(value="/baPorductSave")
	public String baPorductSave(Model model,HttpServletRequest request,IpIntellectualProperty intellectualProperty,String sign){
		HttpSession session =request.getSession();
		IpSysUser user=(IpSysUser) session.getAttribute("user");
		model.addAttribute("code","ba_sproduct_list");
		backstageMerchantService.baPorductSaveOrUpdate(user,intellectualProperty,sign);
		return "/backstage/success";
	}
	/**
	 * @author 张承冰
	 * @time 2017-4-18
	 * 产品删除
	 */
	@RequestMapping(value="/baporductdel")
	public String baPorductDel(Model model,HttpServletRequest request,String id){
		backstageMerchantService.baPorductDel(id);
		model.addAttribute("code", "ba_sproduct_list");
		return "/backstage/success";
	}

	/**
	 * @author 张承冰
	 * @time 2017-4-18
	 * 产品提交
	 */
	@RequestMapping(value="/baporductpresent")
	public String baPorductPresent(Model model,HttpServletRequest request,String id){
		backstageMerchantService.baPorductChangeStatus(id,"2");
		model.addAttribute("code", "ba_sproduct_list");
		return "/backstage/success";
	}
	/**
	 * @author 张承冰
	 * @time 2017-4-16
	 * 产品个数校验
	 */
	@ResponseBody
	@RequestMapping(value="/verifynumber")
	public String baPorductverifynumber(Model model,HttpServletRequest request,String number){
		HttpSession session=request.getSession();
		IpSysUser user=(IpSysUser) session.getAttribute("user");
		int bnumber=backstageMerchantService.verifynumber(user.getId());
		if(bnumber>=Integer.parseInt(number)){
			return "0";
		}else{
			return "1";
		}
	}
	/**
	 * @author 张承冰
	 * @time 2017-4-16
	 * 商家新增前的查询
	 */
	@RequestMapping(value="/baentadd")
	public String baEntAdd(Model model,HttpServletRequest request){
		model.addAttribute("sign", "1");
		return "/backstage/ba_ent_add";
	}
	/**
	 * @author 张承冰
	 * @time 2017-4-16
	 * 商家修改前的查询
	 */
	@RequestMapping(value="/baentalter")
	public String baEntAlter(Model model,HttpServletRequest request,String id){
		model.addAttribute("sign", "2");
		IpEnterprise ipEnterprise=backstageMerchantService.getIpEnterprise(id);
		model.addAttribute("ipEnterprise", ipEnterprise);
		return "/backstage/ba_ent_add";
	}
	/**
	 * @author 张承冰
	 * @time 2017-4-16
	 * 商家修改前的查询
	 */
	@RequestMapping(value="/baentsave")
	public String baEntSave(Model model,HttpServletRequest request,IpEnterprise ipEnterprise,String sign){
		backstageMerchantService.baEntSaveOrUpdate(ipEnterprise,sign);
		model.addAttribute("code", "ba_ent_list");
		return "/backstage/success";
	}
	/**
	 * @author 张承冰
	 * @time 2017-4-19
	 * 商家使用状态的修改
	 */
	@RequestMapping(value="/baentchangestate")
	public String baEntChangeState(Model model,HttpServletRequest request,String id,String sign){
		backstageMerchantService.baEntChangeState(id,sign);
		model.addAttribute("code", "ba_ent_list");
		return "/backstage/success";
	}
	/**
	 * @author 张承冰
	 * @time 2017-4-19
	 * 商家使用状态的修改
	 */
	@RequestMapping(value="/baentdel")
	public String baEntDel(Model model,HttpServletRequest request,String id){
		backstageMerchantService.baEntDel(id);
		model.addAttribute("code", "ba_ent_list");
		return "/backstage/success";
	}
	/**
	 * @author 张承冰
	 * @time 2017-4-19
	 * 商家产品审核
	 */
	@RequestMapping(value="/baproductaudit")
	public String baProductAudit(Model model,HttpServletRequest request,String id,String state){
		backstageMerchantService.baProductAudit(id,state);
		model.addAttribute("code", "ba_pproduct_list");
		return "/backstage/success";
	}
	/**
	 * @author 张承冰
	 * @time 2017-4-19
	 * 商家产品审核
	 */
	@RequestMapping(value="/baadvertisement")
	public String baAdvertisement(Model model,HttpServletRequest request,String id,String state){
		backstageMerchantService.baProductAudit(id,state);
		model.addAttribute("code", "ba_pproduct_list");
		return "/backstage/success";
	}
	/**
	 * @author 张承冰
	 * @time 2017-4-19
	 * 广告信息保存
	 */
	@RequestMapping(value="/baadvertisementsave")
	public String baAdvertisementSave(Model model,HttpServletRequest request,IpAdvertisement ipAdvertisement){
		backstageMerchantService.baAdvertisementSave(ipAdvertisement);
		model.addAttribute("code", "ba_advertisement_list");
		return "/backstage/success";
	}
	/**
	 * @author 张承冰
	 * @time 2017-4-19
	 * 广告个数校验
	 */
	@ResponseBody
	@RequestMapping(value="/verifyadvertisementnumber")
	public String verifyAdvertisementNumber(Model model,HttpServletRequest request,int number){
		if(backstageMerchantService.verifyAdvertisementNumber()>=number){
			return "2";
		}else{
			return "1";
		}
	}
	/**
	 * @author 张承冰
	 * @time 2017-4-19
	 * 广告个数校验
	 */
	@ResponseBody
	@RequestMapping(value="/verifyadvertisementnumbers")
	public int verifyAdvertisementNumbers(Model model,HttpServletRequest request,int number){
		return backstageMerchantService.verifyAdvertisementNumber();
	}
	/**
	 * @author 张承冰
	 * @time 2017-4-19
	 * 广告删除
	 */
	@RequestMapping(value="/verifyadvertisementdel")
	public String verifyAdvertisementDel(Model model,HttpServletRequest request,String id){
		backstageMerchantService.verifyAdvertisementDel(id);
		model.addAttribute("code", "ba_advertisement_list");
		return "/backstage/success";
	}
	/**
	 * @author 张承冰
	 * @time 2017-4-20
	 * 进入后台链接
	 */
	@RequestMapping(value="/backstage")
	public String backstage(Model model,HttpServletRequest request){
		HttpSession session=request.getSession();
		IpSysUser user=(IpSysUser) session.getAttribute("user");
		String code=null;
		if(!user.getIfNature().equals("1")){
			code="ba_sproduct_list";
		}else{
			code="ba_advertisement_list";
		}
		return "forward:/show.action?code="+code;
	}
	/**
	 * @author 张承冰
	 * @time 2017-4-20
	 * 留言前台显示状态
	 */
	@ResponseBody
	@RequestMapping(value="/baleavewordchangeshow")
	public String baLeaveWordChangeShow(Model model,HttpServletRequest request,String id,String state){
		int sign=1-Integer.parseInt(state);
		backstageMerchantService.baLeaveWordChangeShow(id,Integer.toString(sign));
		model.addAttribute("code", "ba_leave_word_list");
		return Integer.toString(sign);
	}
	/**
	 * @author 张承冰
	 * @time 2017-4-20
	 * 删除留言
	 */
	@RequestMapping(value="/baleaveworddel")
	public String baLeaveWordDel(Model model,HttpServletRequest request,String id){
		backstageMerchantService.baLeaveWordDel(id);
		model.addAttribute("code", "ba_leave_word_list");
		return "/backstage/success";
	}
}
