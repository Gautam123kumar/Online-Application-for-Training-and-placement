package com.dts.tpo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.dts.core.dao.AbstractDataAccessObject;
import com.dts.core.util.CoreHash;
import com.dts.core.util.LoggerManager;
import com.dts.tpo.model.Notification;
public class NotificationDAO extends AbstractDataAccessObject{
	
	public Notification notidto;
	public Connection con;
	
	//Registering Vacancy
	
	public void registerNotification(Notification vdto)
	{
		boolean flag=false;
		
		try 
		{
			int notiid = getSequenceID("Notification", "notificationid");
			con = getConnection();
		
			int companyid = vdto.getCompanyID();
			String noofvac = vdto.getNoofvac();
			String jobdesc = vdto.getJobdesc();
			String category = vdto.getCategory();
			String location = vdto.getLocation();
			String desiredskills = vdto.getDesiredskills();
			String createddate = vdto.getCreateddate();
			String expirydate = vdto.getExpirydate();
			String designation = vdto.getDesignation();
		    
		
			PreparedStatement pst = con.prepareStatement("insert into NOTIFICATION values(?,?,?,?,?,?,?,?,?,?,?)");
			
			pst.setInt(1, notiid);
			pst.setInt(2, companyid);
			pst.setString(3, noofvac);
			pst.setString(4, category);
			pst.setString(5, location);
			pst.setString(6, jobdesc);
			pst.setString(7, desiredskills);
			pst.setString(8, createddate);
			pst.setString(9, expirydate);
			pst.setString(10, designation);
		    pst.setString(11, "Process");
			
		   pst.executeUpdate();
			
		} 
		catch (Exception e)
		{
			LoggerManager.writeLogSevere(e);
			
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
    
//get Vacancy details
	
	public CoreHash getNotifications()
	{
	    CoreHash nCoreHash = new CoreHash();
	    Notification vacdto = null;
		try {
			con = getConnection();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from NOTIFICATION");
			int notiid = 0;
			while(rs.next())
			{
				vacdto = new Notification();
				notiid = rs.getInt(1);
				vacdto.setNotificationID(notiid);
				vacdto.setCompanyID(rs.getInt(2)); 
				vacdto.setNoofvac(rs.getString(3));
				vacdto.setCategory(rs.getString(4));
				vacdto.setLocation(rs.getString(5));
				vacdto.setJobdesc(rs.getString(6));
				vacdto.setDesiredskills(rs.getString(7));
				vacdto.setCreateddate1(rs.getDate(8));
				vacdto.setExpirydate1(rs.getDate(9));
				vacdto.setDesignation(rs.getString(10));
				vacdto.setStatus(rs.getString(11));
				
				nCoreHash.put(new Integer(notiid),vacdto);
			}
		}
		catch (Exception e)
		{
			LoggerManager.writeLogSevere(e);
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
		return nCoreHash;
	}
	
	public CoreHash getNotifications(String user)
	{
	    CoreHash nCoreHash = new CoreHash();
	    Notification vacdto = null;
		try {
			con = getConnection();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select n.notificationid,n.companyid,n.noofvac,n.category,n.location,n.jobdesc,n.skills,n.createddate,n.expirydate,n.designation,n.status,p.status from NOTIFICATION n,placements p where p.loginname='"+user+"' and p.notificationid=n.notificationid");
			int notiid = 0;
			while(rs.next())
			{
				vacdto = new Notification();
				notiid = rs.getInt(1);
				vacdto.setNotificationID(notiid);
				vacdto.setCompanyID(rs.getInt(2)); 
				vacdto.setNoofvac(rs.getString(3));
				vacdto.setCategory(rs.getString(4));
				vacdto.setLocation(rs.getString(5));
				vacdto.setJobdesc(rs.getString(6));
				vacdto.setDesiredskills(rs.getString(7));
				vacdto.setCreateddate1(rs.getDate(8));
				vacdto.setExpirydate1(rs.getDate(9));
				vacdto.setDesignation(rs.getString(10));
				vacdto.setStatus(rs.getString(11));
				
				nCoreHash.put(new Integer(notiid),vacdto);
			}
		}
		catch (Exception e)
		{
			LoggerManager.writeLogSevere(e);
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
		return nCoreHash;
	}
	
	
	public CoreHash getNotifications(String loginname, int i)
	{
	    CoreHash nCoreHash = new CoreHash();
	    Notification vacdto = null;
		try {
			con = getConnection();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select n.notificationid,n.companyid,n.noofvac,n.category,n.location,n.jobdesc,n.skills,n.createddate,n.expirydate,n.designation,n.status,p.status from NOTIFICATION n,placements p where p.loginname='"+loginname+"' and p.notificationid=n.notificationid");
			int notiid = 0;
			while(rs.next())
			{
				vacdto = new Notification();
				notiid = rs.getInt(1);
				vacdto.setNotificationID(notiid);
				vacdto.setCompanyID(rs.getInt(2)); 
				vacdto.setNoofvac(rs.getString(3));
				vacdto.setCategory(rs.getString(4));
				vacdto.setLocation(rs.getString(5));
				vacdto.setJobdesc(rs.getString(6));
				vacdto.setDesiredskills(rs.getString(7));
				vacdto.setCreateddate1(rs.getDate(8));
				vacdto.setExpirydate1(rs.getDate(9));
				vacdto.setDesignation(rs.getString(10));
				vacdto.setStatus(rs.getString(12));
				
				nCoreHash.put(new Integer(notiid),vacdto);
			}
		}
		catch (Exception e)
		{
			LoggerManager.writeLogSevere(e);
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
		return nCoreHash;
	}
	
	
	public CoreHash getNotifications(int companyid)
	{
	    CoreHash nCoreHash = new CoreHash();
	    Notification vacdto = null;
		try {
			con = getConnection();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from NOTIFICATION where companyid="+companyid);
			int notiid = 0;
			while(rs.next())
			{
				vacdto = new Notification();
				notiid = rs.getInt(1);
				vacdto.setNotificationID(notiid);
				vacdto.setCompanyID(rs.getInt(2)); 
				vacdto.setNoofvac(rs.getString(3));
				vacdto.setCategory(rs.getString(4));
				vacdto.setLocation(rs.getString(5));
				vacdto.setJobdesc(rs.getString(6));
				vacdto.setDesiredskills(rs.getString(7));
				vacdto.setCreateddate1(rs.getDate(8));
				vacdto.setExpirydate1(rs.getDate(9));
				vacdto.setDesignation(rs.getString(10));
				vacdto.setStatus(rs.getString(11));
				
				nCoreHash.put(new Integer(notiid),vacdto);
			}
		}
		catch (Exception e)
		{
			LoggerManager.writeLogSevere(e);
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
		return nCoreHash;
	}
	
	//getStudentsByCompany
	public CoreHash getStudentsByCompany(int companyid)
	{
	    CoreHash nCoreHash = new CoreHash();
	    Notification vacdto = null;
		try {
			con = getConnection();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select n.notificationid,n.createddate,p.loginname,a.rollno,p.status " +
											"from NOTIFICATION n, placements p, acadamicdetails a where " +
											"n.companyid="+companyid+" and a.loginname=p.loginname and p.status='Recruited'");
			int notiid = 0;
			while(rs.next())
			{
				vacdto = new Notification();
				notiid = rs.getInt(1);
				vacdto.setNotificationID(notiid);
				vacdto.setCreateddate1(rs.getDate(2));
				vacdto.setLoginname(rs.getString(3));
				vacdto.setRollNo(rs.getString(4));
				vacdto.setStatus(rs.getString(5));
				nCoreHash.put(new Integer(notiid),vacdto);
			}
		}
		catch (Exception e)
		{
			LoggerManager.writeLogSevere(e);
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
		return nCoreHash;
	}
	
	//get Vacancy details by id
	
	/*public NotificationDTO getVacancyDetails(int vacancyid)
	{
		NotificationDTO vacdto = null;
		try {
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from ALUMNI_VACANCIES where vacancyid="+vacancyid);
			if(rs.next())
			{
				vacdto = new NotificationDTO();
				vacdto.setVacancyid(rs.getInt(1));
				vacdto.setCompanyname(rs.getString(2));
				vacdto.setCompanyprofile(rs.getString(3));
				vacdto.setVacancyposition(rs.getString(4));
				vacdto.setJobdesc(rs.getString(5));
				vacdto.setCategory(rs.getString(6));
				vacdto.setLocation(rs.getString(7));
				vacdto.setDesiredprofile(rs.getString(8));
				vacdto.setDesiredexp(rs.getString(9));
				vacdto.setCreateddate1(rs.getDate(10));
				vacdto.setExpirydate1(rs.getDate(11));
				vacdto.setContactperson(rs.getString(12));
				vacdto.setDesignation(rs.getString(13));
				vacdto.setPhoneno(rs.getString(14));
				vacdto.setEmail(rs.getString(15));
		    }
		} catch (SQLException sqlex) {
			LoggerManager.writeLogSevere(sqlex);
		}
		return vacdto;	
	}
*/	
// update Vacancy details
	
	public void updateNotification(Notification vdto)
	{
		con = getConnection();
		int notiid = vdto.getNotificationID();
		int companyid = vdto.getCompanyID();
		String noofvac = vdto.getNoofvac();
		String jobdesc = vdto.getJobdesc();
		String category = vdto.getCategory();
		String location = vdto.getLocation();
		String desiredskills = vdto.getDesiredskills();
		String createddate = vdto.getCreateddate();
		String expirydate = vdto.getExpirydate();
		String designation = vdto.getDesignation();
		String status = vdto.getStatus();
		try 
		{
			PreparedStatement pst = con.prepareStatement("update NOTIFICATION set companyid=?,noofvac=?,category=?,location=?,jobdesc=?,skills=?,createddate=?,expirydate=?,designation=?,status=? where notificationid=?");

			pst.setInt(1, companyid);
			pst.setString(2, noofvac);
			pst.setString(3, category);
			pst.setString(4, location);
			pst.setString(5, jobdesc);
			pst.setString(6, desiredskills);
			pst.setString(7, createddate);
			pst.setString(8, expirydate);
			pst.setString(9, designation);
		    pst.setString(10, status);
		    pst.setInt(11, notiid);
		    
			pst.executeUpdate();
		} 
		catch (Exception e) 
		{
			LoggerManager.writeLogSevere(e);
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
	
	
	public void deleteNotification(int notificationid)
	{	
		try
		{
	        con = getConnection();	
	        Statement st = con.createStatement();
	        st.executeUpdate("delete from Notification where notificationid="+notificationid);
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
	
	public void addToNotification(String loginname, int notiid, String rollno)
	{
		try
		{
			con = getConnection();
			PreparedStatement st = con.prepareStatement("insert into placements values(?,?,?,?)");
			
			st.setInt(1, notiid);
			st.setString(2, rollno);
			st.setString(3, loginname);
			st.setString(4, "Process");
			st.executeUpdate();
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
	
	public CoreHash listStudents()
	{
		CoreHash aCoreHash = new CoreHash();
		try
		{
		    con = getConnection();
		    Statement st = con.createStatement();
		    ResultSet rs = st.executeQuery("select * from placements");
		    Notification aNotification = null;
		    int i=1;
		    while(rs.next())
		    {
		    	aNotification = new Notification();
		    	aNotification.setNotificationID(rs.getInt(1));
		    	aNotification.setRollNo(rs.getString(2));
		    	aNotification.setLoginname(rs.getString(3));
		    	aNotification.setStatus(rs.getString(4));
		    	
		    	aCoreHash.put(new Integer(i), aNotification);
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
		return aCoreHash;
	}
	
	
	public void updateStatus(Notification aNotification)
	{
		try
		{
			con = getConnection();
			PreparedStatement st = con.prepareStatement("update placements set status=? where notificationid=? and loginname=?");
			
			st.setInt(2, aNotification.getNotificationID());
			st.setString(3, aNotification.getLoginname());
			st.setString(1, aNotification.getStatus());
			st.executeUpdate();
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
 
	public void setAggregate(String Loginname, String aggregate)
	{
		try
		{
		    con = getConnection();
		    Statement st = con.createStatement();
		    st.executeUpdate("insert into aggregates values('"+Loginname+"',"+aggregate+")");
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
	
	public void updateAggregate(String Loginname, String aggregate)
	{
		try
		{
		    con = getConnection();
		    Statement st = con.createStatement();
		    st.executeUpdate("update aggregates set aggregate="+aggregate+" where loginname='"+Loginname+"'");
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