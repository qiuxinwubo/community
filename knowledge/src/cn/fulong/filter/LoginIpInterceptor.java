package cn.fulong.filter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import cn.fulong.entity.IpSysUser;
import cn.fulong.entity.SysUser;

public class LoginIpInterceptor implements HandlerInterceptor {
	
	
	/**
	 * Handler执行之前调用这个方法
	 */
	@Override
	public boolean preHandle(HttpServletRequest paramHttpServletRequest,
			HttpServletResponse paramHttpServletResponse, Object paramObject)
			throws Exception {
		HttpSession session=paramHttpServletRequest.getSession();
		IpSysUser user=(IpSysUser) session.getAttribute("user");
		if (user == null) {
			paramHttpServletResponse.sendRedirect(paramHttpServletRequest.getContextPath()+"/LoginIpAction/loginbefore.action");
			return false;
		}
		return true;
	}
	
	/**
	 * Handler执行之后，ModelAndView返回之前调用这个方法
	 */
	@Override
	public void postHandle(HttpServletRequest paramHttpServletRequest,
			HttpServletResponse paramHttpServletResponse, Object paramObject,
			ModelAndView paramModelAndView) throws Exception {
		// TODO Auto-generated method stub

	}
	/**
	 * Handler执行完成之后调用这个方法
	 */
	@Override
	public void afterCompletion(HttpServletRequest paramHttpServletRequest,
			HttpServletResponse paramHttpServletResponse, Object paramObject,
			Exception paramException) throws Exception {
		// TODO Auto-generated method stub

	}

}
