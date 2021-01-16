package com.dts.tpo.model;

public class Acadamic {

	private String loginname;
	private int yearofpass1;
	private double percentage1;
	private double percentage2;
	private double percentage3;
	private int yearofpass2;
	private int yearofpass3;
	private int yearofjoining;
	private String course;
	private String rollno;
	private String discipline;
	private String semister;
	private double aggregate;
	
	public double getAggregate() {
		return aggregate;
	}
	public void setAggregate(double aggregate) {
		this.aggregate = aggregate;
	}
	/**
	 * @return the loginname
	 */
	public String getLoginname() {
		return loginname;
	}
	/**
	 * @param loginname the loginname to set
	 */
	public void setLoginname(String loginname) {
		this.loginname = loginname;
	}
	/**
	 * @return the yearofpass
	 */
	public int getYearofpass1() {
		return yearofpass1;
	}
	/**
	 * @param yearofpass the yearofpass to set
	 */
	public void setYearofpass1(int yearofpass1) {
		this.yearofpass1 = yearofpass1;
	}
	/**
	 * @return the yearofjoining
	 */
	public int getYearofjoining() {
		return yearofjoining;
	}
	/**
	 * @param yearofjoining the yearofjoining to set
	 */
	public void setYearofjoining(int yearofjoining) {
		this.yearofjoining = yearofjoining;
	}
	
	/**
	 * @return the rollno
	 */
	public String getRollno() {
		return rollno;
	}
	/**
	 * @param rollno the rollno to set
	 */
	public void setRollno(String rollno) {
		this.rollno = rollno;
	}
	public double getPercentage1() {
		return percentage1;
	}
	public void setPercentage1(double percentage1) {
		this.percentage1 = percentage1;
	}
	public double getPercentage2() {
		return percentage2;
	}
	public void setPercentage2(double percentage2) {
		this.percentage2 = percentage2;
	}
	public double getPercentage3() {
		return percentage3;
	}
	public void setPercentage3(double percentage3) {
		this.percentage3 = percentage3;
	}
	public int getYearofpass2() {
		return yearofpass2;
	}
	public void setYearofpass2(int yearofpass2) {
		this.yearofpass2 = yearofpass2;
	}
	public int getYearofpass3() {
		return yearofpass3;
	}
	public void setYearofpass3(int yearofpass3) {
		this.yearofpass3 = yearofpass3;
	}
	public String getCourse() {
		return course;
	}
	public void setCourse(String course) {
		this.course = course;
	}
	public String getDiscipline() {
		return discipline;
	}
	public void setDiscipline(String discipline) {
		this.discipline = discipline;
	}
	public String getSemister() {
		return semister;
	}
	public void setSemister(String semister) {
		this.semister = semister;
	}
}
