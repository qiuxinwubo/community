package cn.fulong.entity;

import java.io.Serializable;

public class MdmUsersBean implements Serializable {

	/**
	 * 用户主表
	 */
	private static final long serialVersionUID = 1L;
	
	/** 主键 */
	private String pk_zxjpt_user;
	
	/** 账号 */
	private String account;
	
	/** 密码 */
	private String password;
	
	/** 用户状态 */
	private int stataflag;
	
	/** 数据标识 */
	private int dataflag;
	
	/** 系统来源 */
	private int sysflag;
	
	/** 用户类型*/
	private int usertype;
	
	/** 单据号*/
	private String vbillcode;

	/** 单据类型 */
	private String ctrantypeid;
	
	/** 单据类型编码*/
	private String vtrantypecode;
	
	/** 单据日期*/
	private String dbilldate;
	
	/** 单据状态*/
	private int fstatusflag;
	
	/** 制单人*/
	private String operator;
	
	/** 制单日期*/
	private String creationtime;
	
	/** 审批人*/
	private String approver;
	
	/** 备注*/
	private String vnote;
	
	/** 业务流程*/
	private String cbiztypeid;
	
	/** 审批时间*/
	private String audittime;
	
	/** 创建人*/
	private String creator;
	
	/** 修改人*/
	private String modifier;
	
	/** 修改时间*/
	private String modifiedtime;
	
	/** 集团*/
	private String pk_group;
	
	/** 组织*/
	private String pk_org;
	
	/** 组织版本*/
	private String pk_org_v;

	/** 删除标识（0：正常，1：删除） */
	private String dr;
	
	/** 时间戳 */
	private String ts;
	
	/** 备用 */
	private String vdef1;

	/** 备用 */
	private String vdef2;

	/** 备用 */
	private String vdef3;

	/** 备用 */
	private String vdef4;

	/** 备用 */
	private String vdef5;

	/** 备用 */
	private String vdef6;

	/** 备用 */
	private String vdef7;
	
	/** 备用 */
	private String vdef8;

	/** 备用 */
	private String vdef9;
	
	/** 备用 */
	private String vdef10;

	/** 备用 */
	private String vdef11;

	/** 备用 */
	private String vdef12;

	/** 备用 */
	private String vdef13;
	
	/** 备用 */
	private String vdef14;
	
	/** 备用 */
	private String vdef15;
	
	/** 备用 */
	private String vdef16;

	/** 备用 */
	private String vdef17;

	/** 备用 */
	private String vdef18;

	/** 备用 */
	private String vdef19;

	/** 备用 */
	private String vdef20;

	public String getPk_zxjpt_user() {
		return pk_zxjpt_user;
	}

	public void setPk_zxjpt_user(String pk_zxjpt_user) {
		this.pk_zxjpt_user = pk_zxjpt_user;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getStataflag() {
		return stataflag;
	}

	public void setStataflag(int stataflag) {
		this.stataflag = stataflag;
	}

	public int getDataflag() {
		return dataflag;
	}

	public void setDataflag(int dataflag) {
		this.dataflag = dataflag;
	}

	public int getSysflag() {
		return sysflag;
	}

	public void setSysflag(int sysflag) {
		this.sysflag = sysflag;
	}

	public int getUsertype() {
		return usertype;
	}

	public void setUsertype(int usertype) {
		this.usertype = usertype;
	}

	public String getVbillcode() {
		return vbillcode;
	}

	public void setVbillcode(String vbillcode) {
		this.vbillcode = vbillcode;
	}

	public String getCtrantypeid() {
		return ctrantypeid;
	}

	public void setCtrantypeid(String ctrantypeid) {
		this.ctrantypeid = ctrantypeid;
	}

	public String getVtrantypecode() {
		return vtrantypecode;
	}

	public void setVtrantypecode(String vtrantypecode) {
		this.vtrantypecode = vtrantypecode;
	}

	public String getDbilldate() {
		return dbilldate;
	}

	public void setDbilldate(String dbilldate) {
		this.dbilldate = dbilldate;
	}

	public int getFstatusflag() {
		return fstatusflag;
	}

	public void setFstatusflag(int fstatusflag) {
		this.fstatusflag = fstatusflag;
	}

	public String getOperator() {
		return operator;
	}

	public void setOperator(String operator) {
		this.operator = operator;
	}

	public String getCreationtime() {
		return creationtime;
	}

	public void setCreationtime(String creationtime) {
		this.creationtime = creationtime;
	}

	public String getApprover() {
		return approver;
	}

	public void setApprover(String approver) {
		this.approver = approver;
	}

	public String getVnote() {
		return vnote;
	}

	public void setVnote(String vnote) {
		this.vnote = vnote;
	}

	public String getCbiztypeid() {
		return cbiztypeid;
	}

	public void setCbiztypeid(String cbiztypeid) {
		this.cbiztypeid = cbiztypeid;
	}

	public String getAudittime() {
		return audittime;
	}

	public void setAudittime(String audittime) {
		this.audittime = audittime;
	}

	public String getCreator() {
		return creator;
	}

	public void setCreator(String creator) {
		this.creator = creator;
	}

	public String getModifier() {
		return modifier;
	}

	public void setModifier(String modifier) {
		this.modifier = modifier;
	}

	public String getModifiedtime() {
		return modifiedtime;
	}

	public void setModifiedtime(String modifiedtime) {
		this.modifiedtime = modifiedtime;
	}

	public String getPk_group() {
		return pk_group;
	}

	public void setPk_group(String pk_group) {
		this.pk_group = pk_group;
	}

	public String getPk_org() {
		return pk_org;
	}

	public void setPk_org(String pk_org) {
		this.pk_org = pk_org;
	}

	public String getPk_org_v() {
		return pk_org_v;
	}

	public void setPk_org_v(String pk_org_v) {
		this.pk_org_v = pk_org_v;
	}

	public String getDr() {
		return dr;
	}

	public void setDr(String dr) {
		this.dr = dr;
	}

	public String getTs() {
		return ts;
	}

	public void setTs(String ts) {
		this.ts = ts;
	}

	public String getVdef1() {
		return vdef1;
	}

	public void setVdef1(String vdef1) {
		this.vdef1 = vdef1;
	}

	public String getVdef2() {
		return vdef2;
	}

	public void setVdef2(String vdef2) {
		this.vdef2 = vdef2;
	}

	public String getVdef3() {
		return vdef3;
	}

	public void setVdef3(String vdef3) {
		this.vdef3 = vdef3;
	}

	public String getVdef4() {
		return vdef4;
	}

	public void setVdef4(String vdef4) {
		this.vdef4 = vdef4;
	}

	public String getVdef5() {
		return vdef5;
	}

	public void setVdef5(String vdef5) {
		this.vdef5 = vdef5;
	}

	public String getVdef6() {
		return vdef6;
	}

	public void setVdef6(String vdef6) {
		this.vdef6 = vdef6;
	}

	public String getVdef7() {
		return vdef7;
	}

	public void setVdef7(String vdef7) {
		this.vdef7 = vdef7;
	}

	public String getVdef8() {
		return vdef8;
	}

	public void setVdef8(String vdef8) {
		this.vdef8 = vdef8;
	}

	public String getVdef9() {
		return vdef9;
	}

	public void setVdef9(String vdef9) {
		this.vdef9 = vdef9;
	}

	public String getVdef10() {
		return vdef10;
	}

	public void setVdef10(String vdef10) {
		this.vdef10 = vdef10;
	}

	public String getVdef11() {
		return vdef11;
	}

	public void setVdef11(String vdef11) {
		this.vdef11 = vdef11;
	}

	public String getVdef12() {
		return vdef12;
	}

	public void setVdef12(String vdef12) {
		this.vdef12 = vdef12;
	}

	public String getVdef13() {
		return vdef13;
	}

	public void setVdef13(String vdef13) {
		this.vdef13 = vdef13;
	}

	public String getVdef14() {
		return vdef14;
	}

	public void setVdef14(String vdef14) {
		this.vdef14 = vdef14;
	}

	public String getVdef15() {
		return vdef15;
	}

	public void setVdef15(String vdef15) {
		this.vdef15 = vdef15;
	}

	public String getVdef16() {
		return vdef16;
	}

	public void setVdef16(String vdef16) {
		this.vdef16 = vdef16;
	}

	public String getVdef17() {
		return vdef17;
	}

	public void setVdef17(String vdef17) {
		this.vdef17 = vdef17;
	}

	public String getVdef18() {
		return vdef18;
	}

	public void setVdef18(String vdef18) {
		this.vdef18 = vdef18;
	}

	public String getVdef19() {
		return vdef19;
	}

	public void setVdef19(String vdef19) {
		this.vdef19 = vdef19;
	}

	public String getVdef20() {
		return vdef20;
	}

	public void setVdef20(String vdef20) {
		this.vdef20 = vdef20;
	}

}