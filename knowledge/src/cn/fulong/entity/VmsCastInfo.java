package cn.fulong.entity;
import java.sql.Timestamp;
import javax.persistence.Table;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="VMS_CAST_INFO")
public class VmsCastInfo implements java.io.Serializable {
	private String id; 
	private String vidId; 
	private String name; 
	private String speaker; 
	private String ifLogin; 
	private String serviceType; 
	private String explain; 
	private String cover; 
	private String vidPassword; 
	private Timestamp vidCreatetime; 
	private String vidUrl; 
	private String ifShelves; 
	private Integer serialNumber; 
	private String ifDel; 
	private Timestamp upTime;

	@Id
	@GeneratedValue(generator = "uuid")
	@GenericGenerator(name = "uuid", strategy = "uuid")
	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	public String getVidId() {
		return this.vidId;
	}

	public void setVidId(String vidId) {
		this.vidId = vidId;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSpeaker() {
		return this.speaker;
	}

	public void setSpeaker(String speaker) {
		this.speaker = speaker;
	}

	public String getIfLogin() {
		return this.ifLogin;
	}

	public void setIfLogin(String ifLogin) {
		this.ifLogin = ifLogin;
	}

	public String getServiceType() {
		return this.serviceType;
	}

	public void setServiceType(String serviceType) {
		this.serviceType = serviceType;
	}

	public String getExplain() {
		return this.explain;
	}

	public void setExplain(String explain) {
		this.explain = explain;
	}

	public String getCover() {
		return this.cover;
	}

	public void setCover(String cover) {
		this.cover = cover;
	}

	public String getVidPassword() {
		return this.vidPassword;
	}

	public void setVidPassword(String vidPassword) {
		this.vidPassword = vidPassword;
	}

	public Timestamp getVidCreatetime() {
		return this.vidCreatetime;
	}

	public void setVidCreatetime(Timestamp vidCreatetime) {
		this.vidCreatetime = vidCreatetime;
	}

	public String getVidUrl() {
		return this.vidUrl;
	}

	public void setVidUrl(String vidUrl) {
		this.vidUrl = vidUrl;
	}

	public String getIfShelves() {
		return this.ifShelves;
	}

	public void setIfShelves(String ifShelves) {
		this.ifShelves = ifShelves;
	}

	public Integer getSerialNumber() {
		return this.serialNumber;
	}

	public void setSerialNumber(Integer serialNumber) {
		this.serialNumber = serialNumber;
	}

	public String getIfDel() {
		return this.ifDel;
	}

	public void setIfDel(String ifDel) {
		this.ifDel = ifDel;
	}

	public void setUpTime(Timestamp upTime) {
		this.upTime = upTime;
	}

	public Timestamp getUpTime() {
		return upTime;
	}

}