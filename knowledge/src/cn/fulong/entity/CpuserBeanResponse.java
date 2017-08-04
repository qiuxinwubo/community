package cn.fulong.entity;
public class CpuserBeanResponse {

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
	 * 用户实体对象数组
	 */
//	public CpuserBeanMdm[] cpuserBeans;

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

//	public CpuserBeanMdm[] getCpuserBeans() {
//		return cpuserBeans;
//	}
//
//	public void setCpuserBeans(CpuserBeanMdm[] cpuserBeans) {
//		this.cpuserBeans = cpuserBeans;
//	}

}