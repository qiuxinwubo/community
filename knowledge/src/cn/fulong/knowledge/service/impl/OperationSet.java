package cn.fulong.knowledge.service.impl;

import java.util.List;
import org.springframework.stereotype.Repository;
import cn.fulong.common.service.impl.BaseServiceImpl;

/**
 * @author wj
 * @version 2016-9-22 操作集
 */
@Repository("operationSet")
public class OperationSet extends BaseServiceImpl {
	
	/**
	 * 获取Object
	 * 
	 * @param objStr
	 *            字符串对象
	 * @param column
	 *            字段数组（与参数数组对应）
	 * @param params
	 *            参数数组
	 * @param ret
	 *            返回标记：o-对象；l-列表
	 * @return
	 * @throws ClassNotFoundException 
	 */
	public Object getObj(String objStr, String[] column, Object[] params,
			String ret){
		if(params!=null && params.length>0){
			String hql = this.construct_hql(objStr, column);
			List<?> obj = baseTransaction.find(hql, params);
			if (obj != null &&  obj.size() > 0) {
				if ("o".equals(ret)) {
					return obj.get(0);
				}
				return obj;
			}
		}
		return null;
	}
	
	public String construct_hql(String objStr, String[] column) {
		int len = column.length;
		String hql = "from " + objStr + " where";
		for (int i = 0; i < len; i++) {
			if (i == 0) {
				hql += " " + column[i] + "=?";
			} else {
				hql += " and " + column[i] + "=?";
			}
		}
		return hql;
	}
	
	
}
