package cn.fulong.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@SuppressWarnings("serial")
@Entity
@Table(name="IP_RC_DEAL_PRODUCT_STATISTICS")
public class IpRcDealProductStatistics implements java.io.Serializable{
	private String id;
	private String pid;
	private String name;
	private String url;
	private String price;
	private String productNumber;
	
	@Id
	@GeneratedValue(generator = "uuid")
	@GenericGenerator(name = "uuid", strategy = "uuid")
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getProductNumber() {
		return productNumber;
	}
	public void setProductNumber(String productNumber) {
		this.productNumber = productNumber;
	}
	@Override
	public String toString() {
		return "IpRcDealProductStatistics [id=" + id + ", pid=" + pid
				+ ", name=" + name + ", url=" + url + ", price=" + price
				+ ", productNumber=" + productNumber + "]";
	}
	

}
