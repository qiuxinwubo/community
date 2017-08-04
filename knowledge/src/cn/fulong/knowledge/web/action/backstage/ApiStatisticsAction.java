package cn.fulong.knowledge.web.action.backstage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.fulong.entity.IpRcUserStatistics;
import cn.fulong.entity.RcDealStatisticsCover;
import cn.fulong.knowledge.service.ApiStatisticsService;

import com.alibaba.fastjson.JSON;

@Controller
@RequestMapping("/statistics")
public class ApiStatisticsAction {
	@Autowired
	private ApiStatisticsService apiservice;
	
	@ResponseBody
	@RequestMapping(value="user",method=RequestMethod.POST)
	public String receiveUserStatistics(String para){
		System.out.println(para);
		String result = "0";
		System.out.println("================api user");
		try {
			IpRcUserStatistics rcuser = JSON.parseObject(para,IpRcUserStatistics.class);
			System.out.println(rcuser.toString());
			apiservice.saveUser(rcuser);
			result = "1";
		} catch (Exception e) {
			e.printStackTrace();
			result = "0";
		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="deal",method=RequestMethod.POST)
	public String receiveDealStatistics(String para){
		System.out.println(para);
		String result = "0";
		System.out.println("================api deal");
		try {
			RcDealStatisticsCover rcdeal = JSON.parseObject(para, RcDealStatisticsCover.class);
			System.out.println(rcdeal.toString());
			apiservice.saveDeal(rcdeal);
			result = "1";
		} catch (Exception e) {
			e.printStackTrace();
			result = "0";
		}
		return result;
	}
	@ResponseBody
	@RequestMapping(value="videoNumber",method=RequestMethod.POST)
	public String videoNumber(){
		int number=0;
		System.out.println("================api deal");
		try {
			number=apiservice.getvideonumber();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Integer.toString(number);
	}
}
