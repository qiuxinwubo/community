package cn.fulong.entity;
import java.sql.Timestamp;
import javax.persistence.Table;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="SYS_USER")
public class SysUser implements java.io.Serializable {
	private String id; 
	private String username; 
	private String password; 
	private String name; 
	private String phone; 
	private String identification; 
	private Timestamp createtime; 
	private String orgId; 
	private String orgName; 
	private String email; 
	private String flag; 
	private String ifDel; 
	private Timestamp lastLoginTime; 
	private String belongorgType; 
	private String ifAdministrator; 
	private String regSource; 
	private Integer roleCode; 
	private String acceptCode; 
	private String realName; 
	private Timestamp createTime; 
	private String personId; 
	private String qq; 
	private String ifExpert; 
	private String score; 
	private String colleges; 

	@Id
	@GeneratedValue(generator = "uuid")
	@GenericGenerator(name = "uuid", strategy = "uuid")
	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getIdentification() {
		return this.identification;
	}

	public void setIdentification(String identification) {
		this.identification = identification;
	}

	public Timestamp getCreatetime() {
		return this.createtime;
	}

	public void setCreatetime(Timestamp createtime) {
		this.createtime = createtime;
	}

	public String getOrgId() {
		return this.orgId;
	}

	public void setOrgId(String orgId) {
		this.orgId = orgId;
	}

	public String getOrgName() {
		return this.orgName;
	}

	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFlag() {
		return this.flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public String getIfDel() {
		return this.ifDel;
	}

	public void setIfDel(String ifDel) {
		this.ifDel = ifDel;
	}

	public Timestamp getLastLoginTime() {
		return this.lastLoginTime;
	}

	public void setLastLoginTime(Timestamp lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
	}

	public String getBelongorgType() {
		return this.belongorgType;
	}

	public void setBelongorgType(String belongorgType) {
		this.belongorgType = belongorgType;
	}

	public String getIfAdministrator() {
		return this.ifAdministrator;
	}

	public void setIfAdministrator(String ifAdministrator) {
		this.ifAdministrator = ifAdministrator;
	}

	public String getRegSource() {
		return this.regSource;
	}

	public void setRegSource(String regSource) {
		this.regSource = regSource;
	}

	public Integer getRoleCode() {
		return this.roleCode;
	}

	public void setRoleCode(Integer roleCode) {
		this.roleCode = roleCode;
	}

	public String getAcceptCode() {
		return this.acceptCode;
	}

	public void setAcceptCode(String acceptCode) {
		this.acceptCode = acceptCode;
	}

	public String getRealName() {
		return this.realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public Timestamp getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}

	public String getPersonId() {
		return this.personId;
	}

	public void setPersonId(String personId) {
		this.personId = personId;
	}

	public String getQq() {
		return this.qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	public String getIfExpert() {
		return this.ifExpert;
	}

	public void setIfExpert(String ifExpert) {
		this.ifExpert = ifExpert;
	}

	public String getScore() {
		return this.score;
	}

	public void setScore(String score) {
		this.score = score;
	}

	public String getColleges() {
		return this.colleges;
	}

	public void setColleges(String colleges) {
		this.colleges = colleges;
	}

}