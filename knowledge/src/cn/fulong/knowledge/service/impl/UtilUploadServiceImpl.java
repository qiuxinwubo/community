package cn.fulong.knowledge.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import cn.fulong.common.config.Platform;
import cn.fulong.common.service.impl.BaseServiceImpl;
import cn.fulong.entity.IpImageUpload;
import cn.fulong.knowledge.service.UtilUploadService;

@Service("BackstageUploadService")
public class UtilUploadServiceImpl  extends BaseServiceImpl implements UtilUploadService{
	private static final String separator = java.io.File.separator; //分隔符
	private static final String realPath = Platform.getInstance().getRealPath();
	private static final String livePath = separator+"uploadFiles";
	
	
	@Override
	public Map<String,String> UploadImage(MultipartFile file){
		Map<String,String> result =new HashMap<String,String>();
		String mpath = realPath + livePath;
		//检查文件夹是否存在并处理
		createFileFolder(mpath);
		
		if(!file.isEmpty()){
			try {
				IpImageUpload nImgSor = new IpImageUpload();
				nImgSor.setImageUrl("default");
				baseTransaction.save(nImgSor);
				
				String[] oname = file.getOriginalFilename().split("\\.");
				String type = oname[oname.length-1];
				String name = "";
				for (int i = 0; i < oname.length-1; i++) {
					name += oname[i];
				}
				String path = mpath +separator+ name + nImgSor.getId() + "." + type;
				file.transferTo(new File(path));
				nImgSor.setImageUrl(livePath+separator+ name + nImgSor.getId() + "." + type);
				baseTransaction.update(nImgSor);
				result.put("id",nImgSor.getId());
				result.put("url",livePath+separator+ name + nImgSor.getId() + "." + type);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	private static void createFileFolder(String path){
		File file =new File(path);    
		//如果文件夹不存在则创建    
		if  (!file.exists()&&!file.isDirectory())      
		{       
		    file.mkdir();    
		} 
	}
}
