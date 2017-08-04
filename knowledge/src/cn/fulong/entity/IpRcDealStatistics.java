package cn.fulong.entity;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;


@SuppressWarnings("serial")
@Entity
@Table(name="IP_RC_DEAL_STATISTICS")
public class IpRcDealStatistics implements java.io.Serializable{
	private String id;
	private String company;
	private Timestamp transDate;
	private Timestamp dealDate;
	private String turnover;
	private String productNum;
	private String phone;
	private Timestamp createTime;
	@Id
	@GeneratedValue(generator = "uuid")
	@GenericGenerator(name = "uuid", strategy = "uuid")
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public Timestamp getTransDate() {
		return transDate;
	}
	public void setTransDate(Timestamp transDate) {
		this.transDate = transDate;
	}
	public Timestamp getDealDate() {
		return dealDate;
	}
	public void setDealDate(Timestamp dealDate) {
		this.dealDate = dealDate;
	}
	public String getTurnover() {
		return turnover;
	}
	public void setTurnover(String turnover) {
		this.turnover = turnover;
	}
	public String getProductNum() {
		return productNum;
	}
	public void setProductNum(String productNum) {
		this.productNum = productNum;
	}
	public Timestamp getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	@Override
	public String toString() {
		return "IpRcDealStatistics [id=" + id + ", company=" + company
				+ ", transDate=" + transDate + ", dealDate=" + dealDate
				+ ", turnover=" + turnover + ", productNum=" + productNum
				+ ", phone=" + phone + ", createTime=" + createTime + "]";
	}
	
}
