package cn.fulong.filter;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;

import cn.fulong.entity.SysUser;
import cn.fulong.sso.client.filter.Ssoconstant;
import cn.fulong.knowledge.service.DataGatherService;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class Userfilter implements Filter {

	@Resource(name = "dataGatherServiceImpl")
	private DataGatherService dataGatherService;
	@Override
	public void destroy() {

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {

		/*
		 * String s = (String) req
		 * .getAttribute(Ssoconstant.SSO_CLIENT_REQUEST_KEY); Gson gson = new
		 * GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create(); SysUser
		 * su = gson.fromJson(s, SysUser.class); HttpServletRequest request =
		 * (HttpServletRequest) req; if (su != null) { HttpSession session =
		 * request.getSession(); session.removeAttribute("user");
		 * session.removeAttribute("authusercode"); session.setAttribute("user",
		 * su); session.setAttribute("authusercode",
		 * su.getRoleCode().toString()); } chain.doFilter(req, resp);
		 */
		String url = ((HttpServletRequest) request).getServletPath();
		
		String username = null;
		String sessionId = null;
		String usertype = null;
		SysUser user = null;

		// 获取cookie值
		Cookie[] cookies = ((HttpServletRequest) request).getCookies();
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
		System.out.println("Cookie:{sessionId:" + sessionId + "; username:"
				+ username + "}");

		if ((StringUtils.isBlank(sessionId)) && (StringUtils.isBlank(username))) {
			sessionId = request.getParameter("sessionId");
			username = request.getParameter("username");
			usertype = request.getParameter("usertype");

		}

		System.out.println("Param:{sessionId:" + sessionId + "; username:"
				+ username + "; usertype:" + usertype + "}");

		if ((StringUtils.isNotBlank(sessionId))
				&& (StringUtils.isNotBlank(username))) {

			try {
				user = dataGatherService.syncUserByAcAndSid(username,
						sessionId, usertype);
				((HttpServletRequest) request).getSession().setAttribute("user", user);
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("校验获取用户异常!");
			}

		} else {
			HttpSession session = ((HttpServletRequest) request).getSession();
			session.setAttribute("url", url + "?" + ((HttpServletRequest) request).getQueryString());
			user = (SysUser) session.getAttribute("user");
			if (user != null) {
			}

		}
		if (user == null) {
			request.getRequestDispatcher("/html/login.jsp").forward(request,
					response);
			// request.getRequestDispatcher("http://www.smebj.cn/portal/app/mockapp/login.jsp?lrid=1").forward(request,
			// response);
			// String strBackUrl = "http://" + request.getServerName() //服务器地址
			// + ":"
			// + request.getServerPort() //端口号
			// + request.getContextPath() //项目名称
			// + request.getServletPath() //请求页面或其他地址
			// + "?" + (request.getQueryString()); //参数
			// System.out.println(strBackUrl);
			// response.sendRedirect("http://www.smebj.cn/portal/zxjpt/jsp/homeSubmit.jsp?targetUrl=http://www.baidu.com");
		}

	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {

	}

}
