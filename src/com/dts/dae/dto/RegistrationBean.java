package com.dts.dae.dto;

import java.util.Date;

public class RegistrationBean {
	
	private String loginname;
	
	private String LoginID;
	
	private String FirstName;
	
	public String getLoginname() {
		return loginname;
	}

	public void setLoginname(String loginname) {
		this.loginname = loginname;
	}

	public Date getBirthDate1() {
		return BirthDate1;
	}

	private Date BirthDate1;	
	
	private String Hno;
	
	private String Street;
	
	private String City;
	
	private String State;
	
	private String Country;
	
	private String Pincode;
	
	private String PhoneNo;
	
	private String Email;
	
	

	

	public void setBirthDate1(Date date) {
		BirthDate1 = date;
	}

	public String getHno() {
		return Hno;
	}

	public void setHno(String hno) {
		Hno = hno;
	}

	public String getStreet() {
		return Street;
	}

	public void setStreet(String street) {
		Street = street;
	}

	public String getCity() {
		return City;
	}

	public void setCity(String city) {
		City = city;
	}

	public String getState() {
		return State;
	}

	public void setState(String state) {
		State = state;
	}

	public String getCountry() {
		return Country;
	}

	public void setCountry(String country) {
		Country = country;
	}

	public String getPincode() {
		return Pincode;
	}

	public void setPincode(String pincode) {
		Pincode = pincode;
	}

	public String getPhoneNo() {
		return PhoneNo;
	}

	public void setPhoneNo(String phoneNo) {
		PhoneNo = phoneNo;
	}

	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		Email = email;
	}

	

	public String getUsername() {
		return loginname;
	}

	public void setUsername(String username) {
		this.loginname = username;
	}

	public String getLoginID() {
		return LoginID;
	}

	public void setLoginID(String loginID) {
		LoginID = loginID;
	}

	public String getFirstName() {
		return FirstName;
	}

	public void setFirstName(String firstName) {
		FirstName = firstName;
	}

	public String getLastName() {
		return LastName;
	}

	public void setLastName(String lastName) {
		LastName = lastName;
	}

	private String LastName;
	
	
	
}
