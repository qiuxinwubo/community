package cn.fulong.util;

import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import cn.fulong.common.config.Platform;
import cn.fulong.joclass.FileInfo;

/**
 * 上传附件工具类
 * @author ANG
 *
 */
public class UploadFilesUtil {

	private static final String separator = java.io.File.separator; //分隔符
	private static final String realPath = Platform.getInstance().getRealPath();
	private static final String livePath = separator+"uploadFiles"+separator+"live";
	private static final String castPath = separator+"uploadFiles"+separator+"cast";
	
	/**
	 * 上传附件
	 * @param type 
	 * @param files
	 * @param vid_id
	 * @param flag
	 * @return
	 */
	public static List<FileInfo> uploadFiles(HttpServletRequest request,HttpServletResponse response,String id, String type) throws Exception{
		
		//返回前台的文件位置对象
		List<FileInfo> fileInfoList = new ArrayList();
		//文件保存路径
		String path = "";
		if("1".equals(type)){
			path = realPath + livePath+separator+id;
		}
		if("2".equals(type)){
			path = realPath + castPath+separator+id;
		}
		//检查文件夹是否存在并处理
		createFileFolder(path);
		
		//创建一个通用的多部分解析器  
        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(request.getSession().getServletContext());  
        //判断 request 是否有文件上传,即多部分请求  
        if(multipartResolver.isMultipart(request)){  
            //转换成多部分request    
            MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest)request;  
            //取得request中的所有文件名  
            Iterator<String> iter = multiRequest.getFileNames();  
            while(iter.hasNext()){  
                //取得上传文件  
                MultipartFile file = multiRequest.getFile(iter.next());  
                if(file != null){  
                    //取得当前上传文件的文件名称  
                    String myFileName = file.getOriginalFilename();  
                    //如果名称不为“”,说明该文件存在，否则说明该文件不存在  
                    if(myFileName.trim() !=""){
                        //定义上传路径  
                        String filePath = path + separator + myFileName;  
                        
                        //创建fileInfo对象
                        FileInfo fi = new FileInfo();
                        fi.setId(id);
                        fi.setName(myFileName);
                        if("1".equals(type)){
                        	fi.setPath(livePath+separator+id + separator + myFileName);
                		}
                        if("2".equals(type)){
                        	fi.setPath(castPath+separator+id  + separator + myFileName);
                		}
                        fileInfoList.add(fi);
                        
                        File localFile = new File(filePath);  
                        file.transferTo(localFile);  
                    }  
                }  
            }  
        }
		return fileInfoList;  
	}
	
	private static void createFileFolder(String path){
		File file =new File(path);    
		//如果文件夹不存在则创建    
		if  (!file .exists()  && !file .isDirectory())      
		{       
		    file .mkdir();    
		} 
	}
	
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
