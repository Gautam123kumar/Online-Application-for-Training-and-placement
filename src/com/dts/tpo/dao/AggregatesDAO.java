package com.dts.tpo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.dts.core.dao.AbstractDataAccessObject;
import com.dts.core.util.CoreHash;
import com.dts.core.util.LoggerManager;
import com.dts.tpo.model.Aggregates;

public class AggregatesDAO extends AbstractDataAccessObject
{
    Aggregates aAggregates ;
    CoreHash aCoreHash ;
    CoreHash tCoreHash ;
    Connection con;
    
	public CoreHash getAggregates(String loginname)
	{
		try
		{
	         con = getConnection();		
	         Statement st = con.createStatement();
	         ResultSet rs = st.executeQuery("select * from sempercentages where loginname='"+loginname+"'");
	         aCoreHash = new CoreHash();
	         tCoreHash = new CoreHash();
	         int i = 1;
	         while(rs.next())
	         {
	            aAggregates = new Aggregates();
	            i=rs.getInt(2);
	            aAggregates.setSemister(i);
	            aAggregates.setYearOfPass(rs.getInt(3));
	            aAggregates.setAggregate(rs.getDouble(4));
	            aCoreHash.put(new Integer(i), aAggregates);
	         }
	         tCoreHash.put(loginname, aCoreHash);
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
		return tCoreHash;
	}
	
	
	public CoreHash getOverallAggregates()
	{
		try
		{
	         con = getConnection();
	         Statement st = con.createStatement();
	         ResultSet rs = st.executeQuery("select * from aggregates");
	         aCoreHash = new CoreHash();
	        
	         while(rs.next())
	         {
	            aCoreHash.put(rs.getString(1), new Integer(rs.getInt(2)));
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
	
	public CoreHash getAggregates()
	{
		try
		{
	         con = getConnection();		
	         Statement st = con.createStatement();
	         ResultSet rs = st.executeQuery("select * from sempercentages order by semister asc");
	         aCoreHash = new CoreHash();
	         tCoreHash = new CoreHash();
	         int i = 1;
	         String loginname = "";
	         String loginname1 = "";
	         int flag = 0;
	         while(rs.next())
	         {
	        	loginname = rs.getString(1);
	        	
	            aAggregates = new Aggregates();
	            aAggregates.setSemister(rs.getInt(2));
	            aAggregates.setYearOfPass(rs.getInt(3));
	            aAggregates.setAggregate(rs.getDouble(4));
	            
	            if(loginname.equals(loginname1))
	            {
	            	aCoreHash.put(new Integer(i), aAggregates);	
	            }
	            else if(!loginname.equals(loginname1) && flag==0)
	            {
	            	aCoreHash.put(new Integer(i), aAggregates);
	            	flag= 1;
	            	loginname1 = loginname;
	            }
	            if(!loginname.equals(loginname1) && flag==1)
	            {
	            	i=1;
	            	flag = 0;
	            	tCoreHash.put(loginname, aCoreHash);  	
	            	aCoreHash.put(new Integer(i), aAggregates);
	            	loginname1 = ""; 
	            }
	            i++;
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
		return tCoreHash;
	}

	
	public void setAggregate(Aggregates aAggregates)
	{
		Connection con = null;
		try
		{
			int semister = aAggregates.getSemister();
			int year = aAggregates.getYearOfPass();
			double percentage = aAggregates.getAggregate();
			String loginname = aAggregates.getLoginName();
			
			con = getConnection();
			PreparedStatement pst = con.prepareStatement("insert into sempercentages values(?,?,?,?)");
			pst.setString(1, loginname);
			pst.setInt(2, semister);
			pst.setInt(3, year);
			pst.setDouble(4, percentage);
			
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
}
