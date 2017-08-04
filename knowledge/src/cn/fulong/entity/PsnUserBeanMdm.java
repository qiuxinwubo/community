package cn.fulong.entity;
/**
 * 用户实体对象 创建日期:2011-10-20 11:02:15
 * 
 * @author kyz
 * @version 1.0
 */
public class PsnUserBeanMdm {

	/**
	 * 用户主表对象
	 */
	public MdmUsersBean userHeadBean; 
	
	/**
	 * 个人用户子表对象
	 */
	public PersonalUserBean userBodyBean;
	
	/**
	 * 个人用户子表对象集合
	 */
	public PersonalUserBean[] userBodyBeans;

	/**
	 * 登录标识
	 */
	public String loginSign;

	public MdmUsersBean getUserHeadBean() {
		return userHeadBean;
	}

	public void setUserHeadBean(MdmUsersBean userHeadBean) {
		this.userHeadBean = userHeadBean;
	}

	public PersonalUserBean getUserBodyBean() {
		return userBodyBean;
	}

	public void setUserBodyBean(PersonalUserBean userBodyBean) {
		this.userBodyBean = userBodyBean;
	}

	public PersonalUserBean[] getUserBodyBeans() {
		return userBodyBeans;
	}

	public void setUserBodyBeans(PersonalUserBean[] userBodyBeans) {
		this.userBodyBeans = userBodyBeans;
	}

	public String getLoginSign() {
		return loginSign;
	}

	public void setLoginSign(String loginSign) {
		this.loginSign = loginSign;
	}

}