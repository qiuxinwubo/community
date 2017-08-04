package cn.fulong.joclass;

import java.util.List;

public class VmsPagingSynchronization {
	private String code; 
	private List<VmsPagingList> list;
	private VmsPage page;
	
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public List<VmsPagingList> getList() {
		return list;
	}
	public void setList(List<VmsPagingList> list) {
		this.list = list;
	}
	public VmsPage getPage() {
		return page;
	}
	public void setPage(VmsPage page) {
		this.page = page;
	}
	
}
