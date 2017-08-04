package cn.fulong.knowledge.service.impl;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.stereotype.Service;

import cn.fulong.common.service.impl.BaseServiceImpl;
import cn.fulong.entity.IpRcDealProductStatistics;
import cn.fulong.entity.IpRcDealStatistics;
import cn.fulong.entity.IpRcUserStatistics;
import cn.fulong.entity.RcDealStatisticsCover;
import cn.fulong.entity.VmsCastInfo;
import cn.fulong.knowledge.service.ApiStatisticsService;

@Service("ApiStatisticsService")
public class ApiStatisticsServiceImpl extends BaseServiceImpl implements
		ApiStatisticsService {

	@Override
	public void saveUser(IpRcUserStatistics user) {
//		String sql = "from IpRcUserStatistics u where u.phone= ?";
//		List<IpRcUserStatistics> li = baseTransaction.find(sql,new String[]{user.getPhone()});
//		if(li.isEmpty()){
//			user.setCreateTime(new Timestamp(System.currentTimeMillis()));
//			baseTransaction.save(user);
//		}
		user.setCreateTime(new Timestamp(System.currentTimeMillis()));
		baseTransaction.save(user);
	}
	@Override
	public void saveDeal(RcDealStatisticsCover dc){
		IpRcDealStatistics deal = new IpRcDealStatistics();
		deal.setCompany(dc.getCompany());
		deal.setTransDate(dc.getTransDate());
		deal.setDealDate(dc.getDealDate());
		deal.setTurnover(dc.getTurnover());
		deal.setProductNum(dc.getProductNum());
		deal.setPhone(dc.getPhone());
		deal.setCreateTime(new Timestamp(System.currentTimeMillis()));
		baseTransaction.save(deal);
		String id = deal.getId();
		List<IpRcDealProductStatistics> products = dc.getProducts();
		if(products.size()>0){
			for(int i = 0;i < products.size();i++){
				IpRcDealProductStatistics product = products.get(i);
				product.setPid(id);
				baseTransaction.save(product);
			}
		}
	}
	@Override
	public int getvideonumber() {
//		select count(*) 
//		from VMS_CAST_INFO t 
//		where service_type not in('130000','310000','330000') 
//		and if_shelves = '1' and if_del = '1'
		List<VmsCastInfo> list=baseTransaction.find("from VmsCastInfo t where serviceType not in('130000','310000','330000') and ifShelves = '1' and ifDel = '1'");
		return list.size();
	}

}
