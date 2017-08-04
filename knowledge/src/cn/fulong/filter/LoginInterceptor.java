package cn.fulong.filter;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import cn.fulong.common.config.Platform;
import cn.fulong.common.transaction.BaseTransaction;
import cn.fulong.entity.SysUser;
import cn.fulong.knowledge.service.DataGatherService;

/**
 * 登录认证的拦截器
 */
public class LoginInterceptor implements HandlerInterceptor {

	@Resource(name = "dataGatherServiceImpl")
	private DataGatherService dataGatherService;
	
	private BaseTransaction baseDao = (BaseTransaction) Platform.getInstance().getBean("baseTransactionImpl");

	/**
	 * Handler执行之前调用这个方法
	 */
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		response.setHeader("P3P", "CP=CAO PSA OUR");
		String url = request.getServletPath();
		String urlPackage = (url.split("/"))[1];
		if ("home".equals(urlPackage)||"topVideo".equals(request.getParameter("code"))
				||"allService".equals(request.getParameter("code"))||"frontTop".equals(request.getParameter("code"))
				||"commend".equals(request.getParameter("code"))||"secondLevMenu".equals(request.getParameter("code"))||"secondLevMenu2".equals(request.getParameter("code"))) {
			return true;
		}
		
		String username = null;
		String sessionId = null;
		String usertype = null;
		SysUser user = null;
		
		// 获取cookie值
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				Cookie cookie = cookies[i];
				if ("jsId_zxjpt".equals(cookie.getName())) {
					sessionId = cookie.getValue();
				}
				if ("p_userId".equals(cookie.getName())) {
					username = cookie.getValue();
				}
			}
		}
		System.out.println("Cookie:{sessionId:" + sessionId + "; username:" + username + "}");
		
		if ((StringUtils.isBlank(sessionId)) && (StringUtils.isBlank(username))) {
			sessionId = request.getParameter("sessionId");
			username = request.getParameter("username");
			usertype = request.getParameter("usertype");
			
		}
		
		System.out.println("Param:{sessionId:" + sessionId + "; username:" + username + "; usertype:" + usertype +"}");

		if ((StringUtils.isNotBlank(sessionId)) && (StringUtils.isNotBlank(username))) {

			try {
				user = dataGatherService.syncUserByAcAndSid(username, sessionId, usertype);
				request.getSession().setAttribute("user", user);
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("校验获取用户异常!");
			}
			
		} else {
			
			HttpSession session = request.getSession();
			session.setAttribute("url", url + "?" + request.getQueryString());
			user = (SysUser) session.getAttribute("user");
			if (user != null) {
				return true;
			}
			
		}
		if (user == null) {
		request.getRequestDispatcher("/html/login.jsp").forward(request, response);
			//request.getRequestDispatcher("http://www.smebj.cn/portal/app/mockapp/login.jsp?lrid=1").forward(request, response);
//			String strBackUrl = "http://" + request.getServerName() //服务器地址  
//                    + ":"   
//                    + request.getServerPort()           //端口号  
//                    + request.getContextPath()      //项目名称  
//                    + request.getServletPath()      //请求页面或其他地址  
//                + "?" + (request.getQueryString()); //参数
//			System.out.println(strBackUrl);
//			response.sendRedirect("http://www.smebj.cn/portal/zxjpt/jsp/homeSubmit.jsp?targetUrl=http://www.baidu.com");
		}
		return true;

	}

	/**
	 * Handler执行完成之后调用这个方法
	 */
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception exc)
			throws Exception {

	}

	/**
	 * Handler执行之后，ModelAndView返回之前调用这个方法
	 */
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
	}

}