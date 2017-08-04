package cn.fulong.entity;
import java.io.Serializable;

public class GovuserBean implements Serializable {

	/**
	 * @Fields serialVersionUID : TODO(用一句话描述这个变量表示什么)
	 */

	private static final long serialVersionUID = 7684266510861444137L;

	public Integer dr;

	/**
	 * 政府用户名
	 */
	public String account;
	/**
	 * 审批时间
	 */
	public String approvedate;
	/**
	 * 审批人
	 */
	public String approver;
	/**
	 * 制单人
	 */
	public String billmaker;
	/**
	 * 单据类型
	 */
	public String billtype;
	/**
	 * 业务流程
	 */
	public String cbiztypeid;
	/**
	 * 创建时间
	 */
	public String creationtime;
	/**
	 * 创建人
	 */
	public String creator;
	/**
	 * 数据标识
	 */
	public String dataflag;
	/**
	 * 单据日期
	 */
	public String dbilldate;
	/**
	 * 电子邮件
	 */
	public String email;
	/**
	 * 单据状态
	 */
	public Integer fstatusflag;
	/**
	 * 最后修改时间
	 */
	public String modifiedtime;
	/**
	 * 最后修改人
	 */
	public String modifier;
	/**
	 * 密码
	 */
	public String password;
	/**
	 * 电话
	 */
	public String phone;
	/**
	 * 集团
	 */
	public String pk_group;
	/**
	 * 组织
	 */
	public String pk_org;
	/**
	 * 组织版本
	 */
	public String pk_org_v;
	/**
	 * 政府用户主键
	 */
	public String pk_zxjpt_govuser;
	/**
	 * 窗口
	 */
	public String pk_zxjpt_window;
	/**
	 * 用户状态
	 */
	public String stataflag;
	/**
	 * 系统来源
	 */
	public String sysflag;
	/**
	 * 时间戳
	 */
	public String ts;
	/**
	 * 用户类型
	 */
	public String usertype;
	/**
	 * 单据号
	 */
	public String vbillcode;
	/**
	 * 自定义项1
	 */
	public String vdef1;
	/**
	 * 自定义项10
	 */
	public String vdef10;
	/**
	 * 自定义项11
	 */
	public String vdef11;
	/**
	 * 自定义项12
	 */
	public String vdef12;
	/**
	 * 自定义项13
	 */
	public String vdef13;
	/**
	 * 自定义项14
	 */
	public String vdef14;
	/**
	 * 自定义项15
	 */
	public String vdef15;
	/**
	 * 自定义项16
	 */
	public String vdef16;
	/**
	 * 自定义项17
	 */
	public String vdef17;
	/**
	 * 自定义项18
	 */
	public String vdef18;
	/**
	 * 自定义项19
	 */
	public String vdef19;
	/**
	 * 自定义项2
	 */
	public String vdef2;
	/**
	 * 自定义项20
	 */
	public String vdef20;
	/**
	 * 自定义项3
	 */
	public String vdef3;
	/**
	 * 自定义项4
	 */
	public String vdef4;
	/**
	 * 自定义项5
	 */
	public String vdef5;
	/**
	 * 自定义项6
	 */
	public String vdef6;
	/**
	 * 自定义项7
	 */
	public String vdef7;
	/**
	 * 自定义项8
	 */
	public String vdef8;
	/**
	 * 自定义项9
	 */
	public String vdef9;
	/**
	 * 备注
	 */
	public String vnote;
	/**
	 * 单据类型编码
	 */
	public String vtrantypecode;

	/**
	 * 获取政府用户名
	 * 
	 * @return 政府用户名
	 */
	public String getAccount() {
		return this.account;
	}

	/**
	 * 设置政府用户名
	 * 
	 * @param account
	 *            政府用户名
	 */
	public void setAccount(String account) {
		this.account = account;
	}

	/**
	 * 获取审批人
	 * 
	 * @return 审批人
	 */
	public String getApprover() {
		return this.approver;
	}

	/**
	 * 设置审批人
	 * 
	 * @param approver
	 *            审批人
	 */
	public void setApprover(String approver) {
		this.approver = approver;
	}

	/**
	 * 获取制单人
	 * 
	 * @return 制单人
	 */
	public String getBillmaker() {
		return this.billmaker;
	}

	/**
	 * 设置制单人
	 * 
	 * @param billmaker
	 *            制单人
	 */
	public void setBillmaker(String billmaker) {
		this.billmaker = billmaker;
	}

	/**
	 * 获取单据类型
	 * 
	 * @return 单据类型
	 */
	public String getBilltype() {
		return this.billtype;
	}

	/**
	 * 设置单据类型
	 * 
	 * @param billtype
	 *            单据类型
	 */
	public void setBilltype(String billtype) {
		this.billtype = billtype;
	}

	/**
	 * 获取业务流程
	 * 
	 * @return 业务流程
	 */
	public String getCbiztypeid() {
		return this.cbiztypeid;
	}

	/**
	 * 设置业务流程
	 * 
	 * @param cbiztypeid
	 *            业务流程
	 */
	public void setCbiztypeid(String cbiztypeid) {
		this.cbiztypeid = cbiztypeid;
	}

	/**
	 * 获取创建人
	 * 
	 * @return 创建人
	 */
	public String getCreator() {
		return this.creator;
	}

	/**
	 * 设置创建人
	 * 
	 * @param creator
	 *            创建人
	 */
	public void setCreator(String creator) {
		this.creator = creator;
	}

	/**
	 * 获取数据标识
	 * 
	 * @return 数据标识
	 * @see String
	 */
	public String getDataflag() {
		return this.dataflag;
	}

	/**
	 * 设置数据标识
	 * 
	 * @param dataflag
	 *            数据标识
	 * @see String
	 */
	public void setDataflag(String dataflag) {
		this.dataflag = dataflag;
	}

	/**
	 * 获取电子邮件
	 * 
	 * @return 电子邮件
	 */
	public String getEmail() {
		return this.email;
	}

	/**
	 * 设置电子邮件
	 * 
	 * @param email
	 *            电子邮件
	 */
	public void setEmail(String email) {
		this.email = email;
	}

	/**
	 * 获取单据状态
	 * 
	 * @return 单据状态
	 * @see String
	 */
	public Integer getFstatusflag() {
		return this.fstatusflag;
	}

	/**
	 * 设置单据状态
	 * 
	 * @param fstatusflag
	 *            单据状态
	 * @see String
	 */
	public void setFstatusflag(Integer fstatusflag) {
		this.fstatusflag = fstatusflag;
	}

	/**
	 * 获取最后修改人
	 * 
	 * @return 最后修改人
	 */
	public String getModifier() {
		return this.modifier;
	}

	/**
	 * 设置最后修改人
	 * 
	 * @param modifier
	 *            最后修改人
	 */
	public void setModifier(String modifier) {
		this.modifier = modifier;
	}

	/**
	 * 获取密码
	 * 
	 * @return 密码
	 */
	public String getPassword() {
		return this.password;
	}

	/**
	 * 设置密码
	 * 
	 * @param password
	 *            密码
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * 获取电话
	 * 
	 * @return 电话
	 */
	public String getPhone() {
		return this.phone;
	}

	/**
	 * 设置电话
	 * 
	 * @param phone
	 *            电话
	 */
	public void setPhone(String phone) {
		this.phone = phone;
	}

	/**
	 * 获取集团
	 * 
	 * @return 集团
	 */
	public String getPk_group() {
		return this.pk_group;
	}

	/**
	 * 设置集团
	 * 
	 * @param pk_group
	 *            集团
	 */
	public void setPk_group(String pk_group) {
		this.pk_group = pk_group;
	}

	/**
	 * 获取组织
	 * 
	 * @return 组织
	 */
	public String getPk_org() {
		return this.pk_org;
	}

	/**
	 * 设置组织
	 * 
	 * @param pk_org
	 *            组织
	 */
	public void setPk_org(String pk_org) {
		this.pk_org = pk_org;
	}

	/**
	 * 获取组织版本
	 * 
	 * @return 组织版本
	 */
	public String getPk_org_v() {
		return this.pk_org_v;
	}

	/**
	 * 设置组织版本
	 * 
	 * @param pk_org_v
	 *            组织版本
	 */
	public void setPk_org_v(String pk_org_v) {
		this.pk_org_v = pk_org_v;
	}

	/**
	 * 获取政府用户主键
	 * 
	 * @return 政府用户主键
	 */
	public String getPk_zxjpt_govuser() {
		return this.pk_zxjpt_govuser;
	}

	/**
	 * 设置政府用户主键
	 * 
	 * @param pk_zxjpt_govuser
	 *            政府用户主键
	 */
	public void setPk_zxjpt_govuser(String pk_zxjpt_govuser) {
		this.pk_zxjpt_govuser = pk_zxjpt_govuser;
	}

	/**
	 * 获取窗口
	 * 
	 * @return 窗口
	 */
	public String getPk_zxjpt_window() {
		return this.pk_zxjpt_window;
	}

	/**
	 * 设置窗口
	 * 
	 * @param pk_zxjpt_window
	 *            窗口
	 */
	public void setPk_zxjpt_window(String pk_zxjpt_window) {
		this.pk_zxjpt_window = pk_zxjpt_window;
	}

	/**
	 * 获取用户状态
	 * 
	 * @return 用户状态
	 * @see String
	 */
	public String getStataflag() {
		return this.stataflag;
	}

	/**
	 * 设置用户状态
	 * 
	 * @param stataflag
	 *            用户状态
	 * @see String
	 */
	public void setStataflag(String stataflag) {
		this.stataflag = stataflag;
	}

	/**
	 * 获取系统来源
	 * 
	 * @return 系统来源
	 * @see String
	 */
	public String getSysflag() {
		return this.sysflag;
	}

	/**
	 * 设置系统来源
	 * 
	 * @param sysflag
	 *            系统来源
	 * @see String
	 */
	public void setSysflag(String sysflag) {
		this.sysflag = sysflag;
	}

	public String getApprovedate() {
		return approvedate;
	}

	public void setApprovedate(String approvedate) {
		this.approvedate = approvedate;
	}

	public String getCreationtime() {
		return creationtime;
	}

	public void setCreationtime(String creationtime) {
		this.creationtime = creationtime;
	}

	public String getDbilldate() {
		return dbilldate;
	}

	public void setDbilldate(String dbilldate) {
		this.dbilldate = dbilldate;
	}

	public String getModifiedtime() {
		return modifiedtime;
	}

	public void setModifiedtime(String modifiedtime) {
		this.modifiedtime = modifiedtime;
	}

	public String getTs() {
		return ts;
	}

	public void setTs(String ts) {
		this.ts = ts;
	}

	/**
	 * 获取用户类型
	 * 
	 * @return 用户类型
	 * @see String
	 */
	public String getUsertype() {
		return this.usertype;
	}

	/**
	 * 设置用户类型
	 * 
	 * @param usertype
	 *            用户类型
	 * @see String
	 */
	public void setUsertype(String usertype) {
		this.usertype = usertype;
	}

	/**
	 * 获取单据号
	 * 
	 * @return 单据号
	 */
	public String getVbillcode() {
		return this.vbillcode;
	}

	/**
	 * 设置单据号
	 * 
	 * @param vbillcode
	 *            单据号
	 */
	public void setVbillcode(String vbillcode) {
		this.vbillcode = vbillcode;
	}

	/**
	 * 获取自定义项1
	 * 
	 * @return 自定义项1
	 */
	public String getVdef1() {
		return this.vdef1;
	}

	/**
	 * 设置自定义项1
	 * 
	 * @param vdef1
	 *            自定义项1
	 */
	public void setVdef1(String vdef1) {
		this.vdef1 = vdef1;
	}

	/**
	 * 获取自定义项10
	 * 
	 * @return 自定义项10
	 */
	public String getVdef10() {
		return this.vdef10;
	}

	/**
	 * 设置自定义项10
	 * 
	 * @param vdef10
	 *            自定义项10
	 */
	public void setVdef10(String vdef10) {
		this.vdef10 = vdef10;
	}

	/**
	 * 获取自定义项11
	 * 
	 * @return 自定义项11
	 */
	public String getVdef11() {
		return this.vdef11;
	}

	/**
	 * 设置自定义项11
	 * 
	 * @param vdef11
	 *            自定义项11
	 */
	public void setVdef11(String vdef11) {
		this.vdef11 = vdef11;
	}

	/**
	 * 获取自定义项12
	 * 
	 * @return 自定义项12
	 */
	public String getVdef12() {
		return this.vdef12;
	}

	/**
	 * 设置自定义项12
	 * 
	 * @param vdef12
	 *            自定义项12
	 */
	public void setVdef12(String vdef12) {
		this.vdef12 = vdef12;
	}

	/**
	 * 获取自定义项13
	 * 
	 * @return 自定义项13
	 */
	public String getVdef13() {
		return this.vdef13;
	}

	/**
	 * 设置自定义项13
	 * 
	 * @param vdef13
	 *            自定义项13
	 */
	public void setVdef13(String vdef13) {
		this.vdef13 = vdef13;
	}

	/**
	 * 获取自定义项14
	 * 
	 * @return 自定义项14
	 */
	public String getVdef14() {
		return this.vdef14;
	}

	/**
	 * 设置自定义项14
	 * 
	 * @param vdef14
	 *            自定义项14
	 */
	public void setVdef14(String vdef14) {
		this.vdef14 = vdef14;
	}

	/**
	 * 获取自定义项15
	 * 
	 * @return 自定义项15
	 */
	public String getVdef15() {
		return this.vdef15;
	}

	/**
	 * 设置自定义项15
	 * 
	 * @param vdef15
	 *            自定义项15
	 */
	public void setVdef15(String vdef15) {
		this.vdef15 = vdef15;
	}

	/**
	 * 获取自定义项16
	 * 
	 * @return 自定义项16
	 */
	public String getVdef16() {
		return this.vdef16;
	}

	/**
	 * 设置自定义项16
	 * 
	 * @param vdef16
	 *            自定义项16
	 */
	public void setVdef16(String vdef16) {
		this.vdef16 = vdef16;
	}

	/**
	 * 获取自定义项17
	 * 
	 * @return 自定义项17
	 */
	public String getVdef17() {
		return this.vdef17;
	}

	/**
	 * 设置自定义项17
	 * 
	 * @param vdef17
	 *            自定义项17
	 */
	public void setVdef17(String vdef17) {
		this.vdef17 = vdef17;
	}

	/**
	 * 获取自定义项18
	 * 
	 * @return 自定义项18
	 */
	public String getVdef18() {
		return this.vdef18;
	}

	/**
	 * 设置自定义项18
	 * 
	 * @param vdef18
	 *            自定义项18
	 */
	public void setVdef18(String vdef18) {
		this.vdef18 = vdef18;
	}

	/**
	 * 获取自定义项19
	 * 
	 * @return 自定义项19
	 */
	public String getVdef19() {
		return this.vdef19;
	}

	/**
	 * 设置自定义项19
	 * 
	 * @param vdef19
	 *            自定义项19
	 */
	public void setVdef19(String vdef19) {
		this.vdef19 = vdef19;
	}

	/**
	 * 获取自定义项2
	 * 
	 * @return 自定义项2
	 */
	public String getVdef2() {
		return this.vdef2;
	}

	/**
	 * 设置自定义项2
	 * 
	 * @param vdef2
	 *            自定义项2
	 */
	public void setVdef2(String vdef2) {
		this.vdef2 = vdef2;
	}

	/**
	 * 获取自定义项20
	 * 
	 * @return 自定义项20
	 */
	public String getVdef20() {
		return this.vdef20;
	}

	/**
	 * 设置自定义项20
	 * 
	 * @param vdef20
	 *            自定义项20
	 */
	public void setVdef20(String vdef20) {
		this.vdef20 = vdef20;
	}

	/**
	 * 获取自定义项3
	 * 
	 * @return 自定义项3
	 */
	public String getVdef3() {
		return this.vdef3;
	}

	/**
	 * 设置自定义项3
	 * 
	 * @param vdef3
	 *            自定义项3
	 */
	public void setVdef3(String vdef3) {
		this.vdef3 = vdef3;
	}

	/**
	 * 获取自定义项4
	 * 
	 * @return 自定义项4
	 */
	public String getVdef4() {
		return this.vdef4;
	}

	/**
	 * 设置自定义项4
	 * 
	 * @param vdef4
	 *            自定义项4
	 */
	public void setVdef4(String vdef4) {
		this.vdef4 = vdef4;
	}

	/**
	 * 获取自定义项5
	 * 
	 * @return 自定义项5
	 */
	public String getVdef5() {
		return this.vdef5;
	}

	/**
	 * 设置自定义项5
	 * 
	 * @param vdef5
	 *            自定义项5
	 */
	public void setVdef5(String vdef5) {
		this.vdef5 = vdef5;
	}

	/**
	 * 获取自定义项6
	 * 
	 * @return 自定义项6
	 */
	public String getVdef6() {
		return this.vdef6;
	}

	/**
	 * 设置自定义项6
	 * 
	 * @param vdef6
	 *            自定义项6
	 */
	public void setVdef6(String vdef6) {
		this.vdef6 = vdef6;
	}

	/**
	 * 获取自定义项7
	 * 
	 * @return 自定义项7
	 */
	public String getVdef7() {
		return this.vdef7;
	}

	/**
	 * 设置自定义项7
	 * 
	 * @param vdef7
	 *            自定义项7
	 */
	public void setVdef7(String vdef7) {
		this.vdef7 = vdef7;
	}

	/**
	 * 获取自定义项8
	 * 
	 * @return 自定义项8
	 */
	public String getVdef8() {
		return this.vdef8;
	}

	/**
	 * 设置自定义项8
	 * 
	 * @param vdef8
	 *            自定义项8
	 */
	public void setVdef8(String vdef8) {
		this.vdef8 = vdef8;
	}

	/**
	 * 获取自定义项9
	 * 
	 * @return 自定义项9
	 */
	public String getVdef9() {
		return this.vdef9;
	}

	/**
	 * 设置自定义项9
	 * 
	 * @param vdef9
	 *            自定义项9
	 */
	public void setVdef9(String vdef9) {
		this.vdef9 = vdef9;
	}

	/**
	 * 获取备注
	 * 
	 * @return 备注
	 */
	public String getVnote() {
		return this.vnote;
	}

	/**
	 * 设置备注
	 * 
	 * @param vnote
	 *            备注
	 */
	public void setVnote(String vnote) {
		this.vnote = vnote;
	}

	/**
	 * 获取单据类型编码
	 * 
	 * @return 单据类型编码
	 */
	public String getVtrantypecode() {
		return this.vtrantypecode;
	}

	/**
	 * 设置单据类型编码
	 * 
	 * @param vtrantypecode
	 *            单据类型编码
	 */
	public void setVtrantypecode(String vtrantypecode) {
		this.vtrantypecode = vtrantypecode;
	}

	public Integer getDr() {
		return dr;
	}

	public void setDr(Integer dr) {
		this.dr = dr;
	}

}