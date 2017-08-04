package cn.fulong.entity;
import java.sql.Timestamp;
import javax.persistence.Table;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="${tableName}")
public class ${className} implements java.io.Serializable {
  	<#if keyList?exists>
    <#list keyList as key>
	private ${key.java_data_type} ${key.property_name}; 
    </#list>
  	</#if>
	<#if propertyList?exists>
    <#list propertyList as property>
	private ${property.java_data_type} ${property.property_name}; 
    </#list>
  	</#if>

	<#if keyList?exists>
    <#list keyList as key>
	@Id
	<#if "${ifCompositeKey}"="0">
	<#if "${key.data_length}"="32">
	@GeneratedValue(generator = "uuid")
	@GenericGenerator(name = "uuid", strategy = "uuid")
	<#else>
	@GeneratedValue(generator = "assigned")
	@GenericGenerator(name = "assigned", strategy = "assigned")
	</#if>
	</#if>
	public ${key.java_data_type} get${key.property_name2}() {
		return this.${key.property_name};
	}

	public void set${key.property_name2}(${key.java_data_type?if_exists} ${key.property_name}) {
		this.${key.property_name} = ${key.property_name};
	}
	
    </#list>
  	</#if>
	<#if propertyList?exists>
    <#list propertyList as property>
	public ${property.java_data_type} get${property.property_name2}() {
		return this.${property.property_name};
	}

	public void set${property.property_name2}(${property.java_data_type} ${property.property_name}) {
		this.${property.property_name} = ${property.property_name};
	}

    </#list>
  	</#if>
}