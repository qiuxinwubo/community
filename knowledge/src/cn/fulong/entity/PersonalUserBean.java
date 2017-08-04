package cn.fulong.entity;
import java.io.Serializable;

public class PersonalUserBean implements Serializable {

	/**
	 * 个人用户对象
	 */
	private static final long serialVersionUID = 1L;

	/** 个人主键 */
	private String id;

	/** 姓名 */
	private String common_name;

	/** 性别 */
	private String gender;

	/** 个人图片 */
	private String per_pic;

	/** 出生日期 */
	private String birthday;

	/** 婚姻状况 */
	private String marriage;

	/** 证件类型 */
	private String certificate_type;

	/** 证件号 */
	private String certificate_num;

	/** 户口所在地 */
	private String residence;

	/** 居住地省 */
	private String province;

	/** 居住地市 */
	private String city;

	/** 居住地县 */
	private String country;

	/** 通讯地址 */
	private String address;

	/** 邮政编码 */
	private String zipcode;

	/** 手机 */
	private String mobile;

	/** E-mail */
	private String email;

	/** 其他联系方式 */
	private String other_contact_way;

	/** 个人主页 */
	private String website;

	/** 联系方式 */
	private String contact;

	/** 删除标识（0：正常，1：删除） */
	private String dr;

	/** 时间戳 */
	private String ts;

	/** 上层单据主键 */
	private String pk_zxjpt_user;

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

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCommon_name() {
		return common_name;
	}

	public void setCommon_name(String common_name) {
		this.common_name = common_name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPer_pic() {
		return per_pic;
	}

	public void setPer_pic(String per_pic) {
		this.per_pic = per_pic;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getMarriage() {
		return marriage;
	}

	public void setMarriage(String marriage) {
		this.marriage = marriage;
	}

	public String getCertificate_type() {
		return certificate_type;
	}

	public void setCertificate_type(String certificate_type) {
		this.certificate_type = certificate_type;
	}

	public String getCertificate_num() {
		return certificate_num;
	}

	public void setCertificate_num(String certificate_num) {
		this.certificate_num = certificate_num;
	}

	public String getResidence() {
		return residence;
	}

	public void setResidence(String residence) {
		this.residence = residence;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getOther_contact_way() {
		return other_contact_way;
	}

	public void setOther_contact_way(String other_contact_way) {
		this.other_contact_way = other_contact_way;
	}

	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
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

	public String getPk_zxjpt_user() {
		return pk_zxjpt_user;
	}

	public void setPk_zxjpt_user(String pk_zxjpt_user) {
		this.pk_zxjpt_user = pk_zxjpt_user;
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

}