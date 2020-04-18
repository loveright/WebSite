package com.by.entity;

public class User {
	private int uid;
	private String uname;
	private String upassword;
	private String uemail;
	private int uroot;
	private String rtime;
	
	public User() {		
	}
	
	public User(int uid, String uname, String upassword, String uemail, int uroot, String rtime) {		
		this.uid = uid;
		this.uname = uname;
		this.upassword = upassword;
		this.uemail = uemail;
		this.uroot = uroot;
		this.rtime = rtime;
	}

	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getUpassword() {
		return upassword;
	}
	public void setUpassword(String upassword) {
		this.upassword = upassword;
	}
	public String getUemail() {
		return uemail;
	}
	public void setUemail(String uemail) {
		this.uemail = uemail;
	}
	public int getUroot() {
		return uroot;
	}
	public void setUroot(int uroot) {
		this.uroot = uroot;
	}
	public String getRtime() {
		return rtime;
	}
	public void setRtime(String rtime) {
		this.rtime = rtime;
	}

	@Override
	public String toString() {
		return "User [uid=" + uid + ", uname=" + uname + ", upassword=" + upassword + ", uemail=" + uemail + ", uroot="
				+ uroot + ", rtime=" + rtime + "]";
	}
	
}
