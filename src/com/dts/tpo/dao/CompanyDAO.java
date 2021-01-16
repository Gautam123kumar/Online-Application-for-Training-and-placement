package com.dts.tpo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.dts.core.dao.AbstractDataAccessObject;
import com.dts.core.util.CoreHash;
import com.dts.core.util.LoggerManager;
import com.dts.tpo.model.Company;

public class CompanyDAO extends AbstractDataAccessObject {

	Connection con;
	
	public void addCompany(Company aCompany)
	{
		try
		{
			int compid = getSequenceID("Company", "companyid");
			con = getConnection();
			PreparedStatement pst = con.prepareStatement("insert into company values(?,?,?,?,?,?,?,?,?)");
			
			pst.setInt(1, compid);
			pst.setString(2, aCompany.getCompanyName());
			pst.setString(3, aCompany.getProfile());
			pst.setString(4, aCompany.getStreet());
			pst.setString(5, aCompany.getCity());
			pst.setString(6, aCompany.getState());
			pst.setString(7, aCompany.getCountry());
			pst.setString(8, aCompany.getPhone());
			pst.setString(9, aCompany.getEmail());
			
			pst.executeUpdate();
		}
		catch(Exception e)
		{
			LoggerManager.writeLogWarning(e);
		}
	}
	
	public void updateCompany(Company aCompany)
	{
		try
		{
			con = getConnection();
			PreparedStatement pst = con.prepareStatement("update company set companyname=?,profile=?,street=?,city=?,state=?,country=?,phone=?,email=? where companyid=?");
			
			
			pst.setString(1, aCompany.getCompanyName());
			pst.setString(2, aCompany.getProfile());
			pst.setString(3, aCompany.getStreet());
			pst.setString(4, aCompany.getCity());
			pst.setString(5, aCompany.getState());
			pst.setString(6, aCompany.getCountry());
			pst.setString(7, aCompany.getPhone());
			pst.setString(8, aCompany.getEmail());
			pst.setInt(9, aCompany.getCompanyID());
			
			pst.executeUpdate();
		}
		catch(Exception e)
		{
			LoggerManager.writeLogWarning(e);
		}
		finally
		{
			try
			{
				con.close();
			}
			catch(Exception e)
			{
				LoggerManager.writeLogWarning(e);
			}
		}
	}
	
	public Company getCompanyDetails(int companyid)
	{
		Company aCompany = null;
		try
		{
			con = getConnection();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from company where companyid="+companyid);
			if(rs.next())
			{
				aCompany = new Company();
				aCompany.setCompanyID(rs.getInt(1));
				aCompany.setCompanyName(rs.getString(2));
				aCompany.setProfile(rs.getString(3));
				aCompany.setStreet(rs.getString(4));
				aCompany.setCity(rs.getString(5));
				aCompany.setState(rs.getString(6));
				aCompany.setCountry(rs.getString(7));
				aCompany.setPhone(rs.getString(8));
				aCompany.setEmail(rs.getString(9));
			}
			
		}
		catch(Exception e)
		{
			LoggerManager.writeLogWarning(e);
		}
		finally
		{
			try
			{
				con.close();
			}
			catch(Exception e)
			{
				LoggerManager.writeLogWarning(e);
			}
		}
		return aCompany;
	}
	
	
	
	public CoreHash listCompanies()
	{
		Company aCompany = null;
		CoreHash aCoreHash = new CoreHash();
		try
		{
			con = getConnection();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from company");
			int compid = 0;
			while(rs.next())
			{
				aCompany = new Company();
				compid = rs.getInt(1);
				aCompany.setCompanyID(compid);
				aCompany.setCompanyName(rs.getString(2));
				aCompany.setProfile(rs.getString(3));
				aCompany.setStreet(rs.getString(4));
				aCompany.setCity(rs.getString(5));
				aCompany.setState(rs.getString(6));
				aCompany.setCountry(rs.getString(7));
				aCompany.setPhone(rs.getString(8));
				aCompany.setEmail(rs.getString(9));
			    
				aCoreHash.put(new Integer(compid), aCompany);
			}
			
		}
		catch(Exception e)
		{
			LoggerManager.writeLogWarning(e);
		}
		finally
		{
			try
			{
				con.close();
			}
			catch(Exception e)
			{
				LoggerManager.writeLogWarning(e);
			}
		}
		return aCoreHash;
	}
	
	
	
	public void deleteCompany(int companyid)
	{
		Company aCompany = null;
		try
		{
			con = getConnection();
			Statement st = con.createStatement();
			st.executeUpdate("delete from company where companyid="+companyid);
		}
		catch(Exception e)
		{
			LoggerManager.writeLogWarning(e);
		}
		finally
		{
			try
			{
				con.close();
			}
			catch(Exception e)
			{
				LoggerManager.writeLogWarning(e);
			}
		}
	}
}
