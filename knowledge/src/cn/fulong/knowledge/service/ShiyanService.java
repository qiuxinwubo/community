package cn.fulong.knowledge.service;

import cn.fulong.common.service.BaseService;
import cn.fulong.entity.SysUser;

public interface ShiyanService extends BaseService {

	SysUser verify(String username, String pass);

	SysUser getuser(String username);

}
