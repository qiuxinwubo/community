package cn.fulong.entity;

/**
 * 账户实体结果对象 创建日期:2011-10-20 11:00:50
 * 
 * @author kyz
 * @version 1.0
 */
public class UserBeanResponse {
	/**
	 * 成功标志位
	 */
	public String success;

	/**
	 * 错误代码
	 */
	public String errcode;

	/**
	 * 错误信息
	 */
	public String message;

	/**
	 * 用户实体对象集合
	 */
//	public UserBeanMdm userBean;
//	public UserBeanMdm[] userBeans;

	public String getErrcode() {
		return errcode;
	}

	public void setErrcode(String errcode) {
		this.errcode = errcode;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getSuccess() {
		return success;
	}

	public void setSuccess(String success) {
		this.success = success;
	}

//	public UserBeanMdm getUserBean() {
//		return userBean;
//	}
//
//	public void setUserBean(UserBeanMdm userBean) {
//		this.userBean = userBean;
//	}
//
//	public UserBeanMdm[] getUserBeans() {
//		return userBeans;
//	}
//
//	public void setUserBeans(UserBeanMdm[] userBeans) {
//		this.userBeans = userBeans;
//	}

}
