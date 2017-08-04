package cn.fulong.knowledge.web.action;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import cn.fulong.common.web.action.BaseAction;
import cn.fulong.knowledge.service.UtilUploadService;


@Controller
@RequestMapping("/fileupload")
public class FileUploadAction extends BaseAction {
	@Autowired
	private UtilUploadService uploadService;
	
	
	
	/**
	 * 张承冰
	 * 2017-4-18
	 * 图片上传方法
	 */
	@ResponseBody
	@RequestMapping("/imageupload")
	public Map<String,String> ImageUpload(
			@RequestParam(value = "docFile", required = false) CommonsMultipartFile docFile,
			HttpServletRequest request, HttpServletResponse response,
			Model model){
		return uploadService.UploadImage(docFile);
	}
}
