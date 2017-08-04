package cn.fulong.entity;

import java.sql.Timestamp;
import java.util.List;

public class RcDealStatisticsCover {
	
	private String company;
	private Timestamp transDate;
	private Timestamp dealDate;
	private String turnover;
	private String productNum;
	private String phone;
	private List<IpRcDealProductStatistics> products;
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
	public List<IpRcDealProductStatistics> getProducts() {
		return products;
	}
	public void setProducts(List<IpRcDealProductStatistics> products) {
		this.products = products;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	@Override
	public String toString() {
		return "RcDealStatisticsCover [company=" + company + ", transDate="
				+ transDate + ", dealDate=" + dealDate + ", turnover="
				+ turnover + ", productNum=" + productNum + ", phone=" + phone
				+ ", products=" + products + "]";
	}
	
}
