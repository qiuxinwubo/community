package cn.fulong;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/frameshiyan")
public class shiyank {
	@RequestMapping("/shiyan")
	public String shiyan(){
		return "/shiyan";
	}
}
