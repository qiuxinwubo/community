package cn.fulong.entity;
public class GovuserBeanMdm {
	private GovuserBean govuser;

	/**
	 * 登录标识
	 */
	private String loginSign;
	
	public GovuserBean getGovuser() {
		return govuser;
	}

	public void setGovuser(GovuserBean govuser) {
		this.govuser = govuser;
	}

	public String getLoginSign() {
		return loginSign;
	}

	public void setLoginSign(String loginSign) {
		this.loginSign = loginSign;
	}

}
