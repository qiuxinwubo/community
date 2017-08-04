package cn.fulong.knowledge.service;

import cn.fulong.common.service.BaseService;
import cn.fulong.entity.IpRcUserStatistics;
import cn.fulong.entity.RcDealStatisticsCover;

public interface ApiStatisticsService extends BaseService{

	void saveUser(IpRcUserStatistics user);

	void saveDeal(RcDealStatisticsCover dc);

	int getvideonumber();
	
	
	  

}
