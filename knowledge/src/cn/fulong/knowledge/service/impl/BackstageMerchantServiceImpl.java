package cn.fulong.knowledge.service.impl;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.stereotype.Service;

import cn.fulong.common.service.impl.BaseServiceImpl;
import cn.fulong.entity.IpAdvertisement;
import cn.fulong.entity.IpEnterprise;
import cn.fulong.entity.IpImageUpload;
import cn.fulong.entity.IpIntellectualProperty;
import cn.fulong.entity.IpLeaveWords;
import cn.fulong.entity.IpSysUser;
import cn.fulong.entity.SysUser;
import cn.fulong.knowledge.service.BackstageMerchantService;


@Service("backstageMerchantServiceImpl")
public class BackstageMerchantServiceImpl extends BaseServiceImpl implements BackstageMerchantService {

	@Override
	public List<IpEnterprise> getEntList() {
		List<IpEnterprise> list=baseTransaction.find("from IpEnterprise where ifDel = '0' and state='2'");
		return list;
	}

	@Override
	public void baPorductSaveOrUpdate(IpSysUser user,IpIntellectualProperty intellectualProperty,String sign) {
		Timestamp currentTime = new Timestamp(System.currentTimeMillis());
		intellectualProperty.setCreateId(user.getId());
		intellectualProperty.setCreateTime(currentTime);
		intellectualProperty.setIfDel("0");
		if(sign.equals("1")){
			baseTransaction.save(intellectualProperty);
		}else{
			baseTransaction.update(intellectualProperty);
		}
	}

	@Override
	public void baPorductChangeStatus(String id,String state) {
		IpIntellectualProperty intellectualProperty=(IpIntellectualProperty) baseTransaction.get(IpIntellectualProperty.class, id);
		intellectualProperty.setState(state);
		baseTransaction.update(intellectualProperty);
	}

	@Override
	public void baPorductDel(String id) {
		IpIntellectualProperty intellectualProperty=(IpIntellectualProperty) baseTransaction.get(IpIntellectualProperty.class, id);
		intellectualProperty.setIfDel("1");
		baseTransaction.update(intellectualProperty);
	}

	@Override
	public IpIntellectualProperty getIpIntellectualProperty(String id) {
		IpIntellectualProperty ipIntellectualProperty=(IpIntellectualProperty) baseTransaction.get(IpIntellectualProperty.class, id);
		return ipIntellectualProperty;
	}

	@Override
	public IpImageUpload getIpImageUpload(String image) {
		if(image==null)
			return null;
		IpImageUpload ipImageUpload=(IpImageUpload) baseTransaction.get(IpImageUpload.class, image);
		return ipImageUpload;
	}

	@Override
	public int verifynumber(String id) {
		List<IpIntellectualProperty> list=baseTransaction.find("from IpIntellectualProperty where ifDel='0' and createId=?",new Object[]{id});
		return list.size();
	}

	@Override
	public IpEnterprise getIpEnterprise(String id) {
		IpEnterprise ipEnterprise=(IpEnterprise) baseTransaction.get(IpEnterprise.class, id);
		return ipEnterprise;
	}

	@Override
	public void baEntSaveOrUpdate(IpEnterprise ipEnterprise, String sign) {
		Timestamp currentTime = new Timestamp(System.currentTimeMillis());
		ipEnterprise.setCreateTime(currentTime);
		ipEnterprise.setIfDel("0");
		ipEnterprise.setState("2");
		if(sign.equals("1")){
			baseTransaction.save(ipEnterprise);
		}else{
			baseTransaction.update(ipEnterprise);
		}
	}

	@Override
	public void baEntChangeState(String id, String sign) {
		IpEnterprise ipEnterprise=(IpEnterprise) baseTransaction.get(IpEnterprise.class, id);
		ipEnterprise.setState(sign);
		baseTransaction.update(ipEnterprise);
	}

	@Override
	public void baEntDel(String id) {
		IpEnterprise ipEnterprise=(IpEnterprise) baseTransaction.get(IpEnterprise.class, id);
		ipEnterprise.setIfDel("1");
		baseTransaction.update(ipEnterprise);
	}

	@Override
	public void baProductAudit(String id, String state) {
		IpIntellectualProperty ipIntellectualProperty=(IpIntellectualProperty) baseTransaction.get(IpIntellectualProperty.class,id);
		ipIntellectualProperty.setState(state);
		baseTransaction.update(ipIntellectualProperty);
	}

	@Override
	public void baAdvertisementSave(IpAdvertisement ipAdvertisement) {
		Timestamp timestamp=new Timestamp(System.currentTimeMillis());
		ipAdvertisement.setCreateTime(timestamp);
		ipAdvertisement.setIfDel("0");
		baseTransaction.save(ipAdvertisement);
	}

	@Override
	public int verifyAdvertisementNumber() {
		List<IpAdvertisement> list=baseTransaction.find("from IpAdvertisement where ifDel=0");
		return list.size();
	}

	@Override
	public void verifyAdvertisementDel(String id) {
		IpAdvertisement ipAdvertisement=(IpAdvertisement) baseTransaction.get(IpAdvertisement.class, id);
		ipAdvertisement.setIfDel("1");
		baseTransaction.update(ipAdvertisement);
	}

	@Override
	public void baLeaveWordChangeShow(String id, String state) {
		IpLeaveWords ipLeaveWords=(IpLeaveWords) baseTransaction.get(IpLeaveWords.class, id);
		ipLeaveWords.setIfShow(state);
		baseTransaction.update(ipLeaveWords);
	}

	@Override
	public void baLeaveWordDel(String id) {
		IpLeaveWords ipLeaveWords=(IpLeaveWords) baseTransaction.get(IpLeaveWords.class, id);
		ipLeaveWords.setIfDel("1");
		baseTransaction.update(ipLeaveWords);
	}
}
