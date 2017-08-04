package cn.fulong.entity;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;


@Entity
@Table(name="IP_ADVERTISEMENT")
public class IpAdvertisement {
	private String id;
	private String imageId;
	private String ipAdvertisementLink;
	private String ifDel;
	private Timestamp createTime;
	
	
	
	@Id
	@GeneratedValue(generator="uuid")
	@GenericGenerator(name="uuid", strategy = "uuid")
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getImageId() {
		return imageId;
	}
	public void setImageId(String imageId) {
		this.imageId = imageId;
	}
	public String getIpAdvertisementLink() {
		return ipAdvertisementLink;
	}
	public void setIpAdvertisementLink(String ipAdvertisementLink) {
		this.ipAdvertisementLink = ipAdvertisementLink;
	}
	public String getIfDel() {
		return ifDel;
	}
	public void setIfDel(String ifDel) {
		this.ifDel = ifDel;
	}
	public Timestamp getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}

}
