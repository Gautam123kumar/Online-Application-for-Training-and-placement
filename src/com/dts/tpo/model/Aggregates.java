package com.dts.tpo.model;

public class Aggregates {

	private String loginName;
	private int semister;
	private int yearOfPass;
	private double aggregate;
	public String getLoginName() {
		return loginName;
	}
	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}
	public int getSemister() {
		return semister;
	}
	public void setSemister(int semister) {
		this.semister = semister;
	}
	public int getYearOfPass() {
		return yearOfPass;
	}
	public void setYearOfPass(int yearOfPass) {
		this.yearOfPass = yearOfPass;
	}
	public double getAggregate() {
		return aggregate;
	}
	public void setAggregate(double aggregate) {
		this.aggregate = aggregate;
	} 
}
