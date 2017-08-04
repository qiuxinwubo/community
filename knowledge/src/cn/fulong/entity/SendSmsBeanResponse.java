package cn.fulong.entity;
/**
 *账户实体结果对象
 * 创建日期:2013-10-20 11:00:50
 * @author zh
 * @version  1.0
 */
public class SendSmsBeanResponse {
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

	public String getSuccess() {
		return success;
	}

	public void setSuccess(String success) {
		this.success = success;
	}

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
	
}
