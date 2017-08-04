package cn.fulong.knowledge.service;

import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import cn.fulong.common.service.BaseService;

public interface UtilUploadService extends BaseService {
	
	/**
	 * 上传图片;
	 * 图片路径在 /knowledge/WebContent/WEB-INF/config/storagePath.properties 里配置
	 * @param file 要上传的文件
	 * @return 返回值为图片在数据库的 id；如果保存失败返回值为 String:"fail"。
	 */
	Map<String,String> UploadImage(MultipartFile file);

}
