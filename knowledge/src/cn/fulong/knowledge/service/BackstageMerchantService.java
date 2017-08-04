package cn.fulong.knowledge.service;

import java.util.List;

import cn.fulong.common.service.BaseService;
import cn.fulong.entity.IpAdvertisement;
import cn.fulong.entity.IpEnterprise;
import cn.fulong.entity.IpImageUpload;
import cn.fulong.entity.IpIntellectualProperty;
import cn.fulong.entity.IpSysUser;
import cn.fulong.entity.SysUser;

public interface BackstageMerchantService extends BaseService {

	public List<IpEnterprise> getEntList();

	public void baPorductSaveOrUpdate(IpSysUser user,IpIntellectualProperty intellectualProperty,String sign);


	public void baPorductDel(String id);

	public void baPorductChangeStatus(String id, String string);

	public IpIntellectualProperty getIpIntellectualProperty(String id);

	public IpImageUpload getIpImageUpload(String image);

	public int verifynumber(String id);

	public IpEnterprise getIpEnterprise(String id);

	public void baEntSaveOrUpdate(IpEnterprise ipEnterprise, String sign);

	public void baEntChangeState(String id, String sign);

	public void baEntDel(String id);

	public void baProductAudit(String id, String state);

	public void baAdvertisementSave(IpAdvertisement ipAdvertisement);

	public int verifyAdvertisementNumber();

	public void verifyAdvertisementDel(String id);

	public void baLeaveWordChangeShow(String id, String state);

	public void baLeaveWordDel(String id);
}
