package cn.fulong.knowledge.service;
import cn.fulong.common.service.BaseService;
import cn.fulong.entity.IpSkipRecord;
import cn.fulong.entity.IpSysUser;

public interface ReceptionService extends BaseService {

	boolean saveSkipRecord(IpSkipRecord ipSkipRecord);

	String getChatUrl(String entId);

	void saveLeaveWord(String content,IpSysUser user);
	
	
}