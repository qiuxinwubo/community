package cn.fulong.knowledge.service.impl;
import java.sql.Timestamp;
import java.util.List;

import org.springframework.stereotype.Service;

import cn.fulong.common.service.impl.BaseServiceImpl;
import cn.fulong.entity.IpEnterprise;
import cn.fulong.entity.IpLeaveWords;
import cn.fulong.entity.IpSkipRecord;
import cn.fulong.entity.IpSysUser;
import cn.fulong.knowledge.service.ReceptionService;

@Service("receptionServiceImpl")
public class ReceptionServiceImpl extends BaseServiceImpl implements ReceptionService {
	@Override
	public boolean saveSkipRecord(IpSkipRecord ipSkipRecord){
		boolean flag;
		if(ipSkipRecord!=null){
			ipSkipRecord.setSkipTime(new Timestamp(System.currentTimeMillis()));
			baseTransaction.save(ipSkipRecord);
			flag = true;
		}else{
			flag = false;
		}
		return flag;
	}
	@Override
	public String getChatUrl(String entId){
		String url = "";
		IpEnterprise ent =  (IpEnterprise) baseTransaction.get(IpEnterprise.class, entId);
		if(ent!=null){
			url = ent.getAdvisoryUrl();
		}else{
			url = "none";
		}
		return url;
	}
	@Override
	public void saveLeaveWord(String content,IpSysUser user) {
		IpLeaveWords ipLeaveWords=new IpLeaveWords();
		ipLeaveWords.setContent(content);
		ipLeaveWords.setCreateId(user.getId());
		ipLeaveWords.setIfDel("0");
		ipLeaveWords.setIfShow("0");
		Timestamp timestamp=new Timestamp(System.currentTimeMillis());
		ipLeaveWords.setCreateTime(timestamp);
		baseTransaction.save(ipLeaveWords);
	}
	
}