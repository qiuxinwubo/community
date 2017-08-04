package cn.fulong.entity;
/**
 *账户实体结果对象
 * 创建日期:2011-10-20 11:00:50
 * @author kyz
 * @version  1.0
 */
public class PsnUserBeanResponse {
	/**
	 * 成功标志位
	 */
	public String success = "1";

	/**
	 * 错误代码
	 */
	public String errcode;

	/**
	 * 错误信息
	 */
	public String message = "成功";

	/**
	 * 用户实体对象集合
	 */
	public PsnUserBeanMdm psnUserBean; 
	
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

	public PsnUserBeanMdm getPsnUserBean() {
		return psnUserBean;
	}

	public void setPsnUserBean(PsnUserBeanMdm psnUserBean) {
		this.psnUserBean = psnUserBean;
	}

}
