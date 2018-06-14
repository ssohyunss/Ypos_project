package com.dongyang.project.domain;

public class LoginVO {
	private String tid = "";
	private String site_tid = "";
	private String mid = "";
	private String mpw = "";
	private String name = "";
	private String create_date = "";
	public String getTid() { 
		return tid; 
	}
	public void setTid(String tid) { 
		this.tid = tid; 
	}
	public String getSite_tid() { 
		return site_tid; 
	}
	public void setSite_tid(String site_tid) { 
		this.site_tid = site_tid; 
	}
	public String getMid() { 
		return mid; 
	}
	public void setMid(String mid) { 
		this.mid = mid; 
	}
	public String getMpw() { 
		return mpw; 
	}
	public void setMpw(String mpw) { 
		this.mpw = mpw; 
	}
	public String getName() { 
		return name; 
	}
	public void setName(String name) { 
		this.name = name; 
	}
	public String getCreate_date() { 
		return create_date; 
	}
	public void setCreate_date(String create_date) { 
		this.create_date = create_date; 
	}
}
