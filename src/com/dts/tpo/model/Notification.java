package com.dts.tpo.model;

import java.sql.Date;

public class Notification {
	
	//instance variables
	
	private int notificationID;
	private int companyID;
	private String noofvac;
	private String jobdesc;
	private String category;
	private String location;
	private String desiredskills;
	private String createddate;
	private Date createddate1;
	private String expirydate;
	private Date expirydate1;
	private String designation;
	private String status;
	private String loginname;
	private String rollNo;
	
	public String getRollNo() {
		return rollNo;
	}
	public void setRollNo(String rollNo) {
		this.rollNo = rollNo;
	}
	public String getLoginname() {
		return loginname;
	}
	public void setLoginname(String loginname) {
		this.loginname = loginname;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getNotificationID() {
		return notificationID;
	}
	public void setNotificationID(int notificationID) {
		this.notificationID = notificationID;
	}
	public int getCompanyID() {
		return companyID;
	}
	public void setCompanyID(int companyID) {
		this.companyID = companyID;
	}
	public String getNoofvac() {
		return noofvac;
	}
	public void setNoofvac(String noofvac) {
		this.noofvac = noofvac;
	}
	public String getJobdesc() {
		return jobdesc;
	}
	public void setJobdesc(String jobdesc) {
		this.jobdesc = jobdesc;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getDesiredskills() {
		return desiredskills;
	}
	public void setDesiredskills(String desiredskills) {
		this.desiredskills = desiredskills;
	}
	public String getCreateddate() {
		return createddate;
	}
	public void setCreateddate(String createddate) {
		this.createddate = createddate;
	}
	public Date getCreateddate1() {
		return createddate1;
	}
	public void setCreateddate1(Date createddate1) {
		this.createddate1 = createddate1;
	}
	public String getExpirydate() {
		return expirydate;
	}
	public void setExpirydate(String expirydate) {
		this.expirydate = expirydate;
	}
	public Date getExpirydate1() {
		return expirydate1;
	}
	public void setExpirydate1(Date expirydate1) {
		this.expirydate1 = expirydate1;
	}
	public String getDesignation() {
		return designation;
	}
	public void setDesignation(String designation) {
		this.designation = designation;
	}	
}
