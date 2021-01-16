package com.dts.tpo.model;

import java.sql.Date;

public class Training {

	private int trainingid;
	private String trainingName;
	private String trainingDate;
	private Date trainingDate1;
	private String trainingtime;
	private String description;
	private String status;
	public int getTrainingid() {
		return trainingid;
	}
	public void setTrainingid(int trainingid) {
		this.trainingid = trainingid;
	}
	public String getTrainingName() {
		return trainingName;
	}
	public void setTrainingName(String trainingName) {
		this.trainingName = trainingName;
	}
	public String getTrainingDate() {
		return trainingDate;
	}
	public void setTrainingDate(String trainingDate) {
		this.trainingDate = trainingDate;
	}
	public Date getTrainingDate1() {
		return trainingDate1;
	}
	public void setTrainingDate1(Date trainingDate1) {
		this.trainingDate1 = trainingDate1;
	}
	public String getTrainingtime() {
		return trainingtime;
	}
	public void setTrainingtime(String trainingtime) {
		this.trainingtime = trainingtime;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
}
