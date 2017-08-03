package cn.management.control;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;



@Controller
public class HelloController {
	
	@RequestMapping("/hello")
	public @ResponseBody String test() {
        return "hello, world! This com from spring!";
    }
	@RequestMapping("/freemarker")
	public String freemaker() {
		return "/shiyan/shiyan";
	}
}
