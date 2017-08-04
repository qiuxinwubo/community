package cn.fulong.entity;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;


@Entity
@Table(name="IP_TRANSACTION_RECORD")
public class IpTransactionRecord {
	private String id;
	private String propertyId;
	private String entId;
	private Timestamp traTime;
	private String traNumber;
	
	
	@Id
	@GeneratedValue(generator = "uuid")
	@GenericGenerator(name = "uuid", strategy = "uuid")
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPropertyId() {
		return propertyId;
	}
	public void setPropertyId(String propertyId) {
		this.propertyId = propertyId;
	}
	public String getEntId() {
		return entId;
	}
	public void setEntId(String entId) {
		this.entId = entId;
	}
	public Timestamp getTraTime() {
		return traTime;
	}
	public void setTraTime(Timestamp traTime) {
		this.traTime = traTime;
	}
	public String getTraNumber() {
		return traNumber;
	}
	public void setTraNumber(String traNumber) {
		this.traNumber = traNumber;
	}
	
}
