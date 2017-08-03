package cn.management.control;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.management.entity.SysUser;



@Controller
public class HelloController {
	
	@Autowired
    private SessionFactory sessionFactory;
	
	@RequestMapping("/hello")
	public @ResponseBody String test() {
        return "hello, world! This com from spring!";
    }
	@RequestMapping("/freemarker")
	public String freemaker() {
		return "/shiyan/shiyan";
	}
	@RequestMapping("/entity")
	public String entity() {
		SysUser user=new SysUser();
//		user.setId("1111");
		user.setIfDel("1");
		user.setUsername("zhang");
		user.setPassword("343492");
		sessionFactory.openSession().save(user);
		return "/shiyan/shiyan";
	}
}
