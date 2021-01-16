package com.dts.tpo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.dts.core.dao.AbstractDataAccessObject;
import com.dts.core.util.CoreHash;
import com.dts.core.util.LoggerManager;
import com.dts.tpo.model.Acadamic;

public class AcadamicDAO extends AbstractDataAccessObject{
  
	Connection con;
	public AcadamicDAO()
	{
		con=getConnection();
	}
	
	//Registering acadamic details
	public boolean registerAcadamicDetails(Acadamic adto)
	{
		Statement st;
		boolean flag = false;
		
		try {
              String loginname = adto.getLoginname();
              int yearofpass1 = adto.getYearofpass1();
              double percentage1 = adto.getPercentage1(); 
              int yearofpass2 = adto.getYearofpass2();
              double percentage2 = adto.getPercentage2();
              int yearofpass3 = adto.getYearofpass3();
              double percentage3 = adto.getPercentage3();
              String rollno = adto.getRollno();
              int yearofjoin = adto.getYearofjoining();
              String course = adto.getCourse();
              String discipline = adto.getDiscipline();
              String semister = adto.getSemister();
              
              PreparedStatement pst = con.prepareStatement("insert into ACADAMICDETAILS values(?,?,?,?,?,?,?,?,?,?,?,?)");
              
              pst.setString(1, loginname);
              pst.setInt(2, yearofpass1);
              pst.setDouble(3, percentage1);
              pst.setInt(4, yearofpass2);
              pst.setDouble(5, percentage2);
              pst.setInt(6, yearofpass3);
              pst.setDouble(7, percentage3);
              pst.setString(8, rollno);
              pst.setInt(9, yearofjoin);
              pst.setString(10, course);
              pst.setString(11, discipline);
              pst.setString(12, semister);

              int i=pst.executeUpdate();
              
              if(i!=0)
              {
            	  /*    st=con.createStatement();
                      st.executeUpdate("Update logindetails set firstlogin=1 where loginname='"+loginname+"'");
                      flag=true;*/ 
           	  
            	//===============
                  PreparedStatement pst2 = con.prepareStatement("insert into AGGREGATES values(?,?)");
                  
                  pst2.setString(1, loginname);
                  pst2.setDouble(2, percentage3);
                               int i2=pst2.executeUpdate();
                  
                  if(i2!=0)
                  {
                	      st=con.createStatement();
                          st.executeUpdate("Update logindetails set firstlogin=1 where loginname='"+loginname+"'");
                          flag=true; 
               	  
                  }
                  else
                	  flag=false;
                  
                //==============
            	  
              }
              else
            	  flag=false;
              
                
              
		} catch (SQLException e) {
			flag=false;
			LoggerManager.writeLogSevere(e);
		}
		return flag;
	}
	
	//checking acadamic details
	public boolean checkAcadamicDetails(String loginname)
	{
		Statement st;
		boolean flag = false;
		try {
			st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from ACADAMICDETAILS where loginname='"+loginname+"'");
			if(rs.next())
				flag = true;
				
		} catch (SQLException e) {
			LoggerManager.writeLogSevere(e);
		}
		return flag;
	}
	
	//get Acadamic details
	
	public Acadamic getAcademicDetails(String loginname)
	{
		Acadamic acdto=null;
		try
		{
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select sscyop,sscpercentage,ugyop,ugpercentage," +
					"gyop,gpercentage,rollno,yearofjoining,course,discipline,semister " +
					"from ACADAMICDETAILS where loginname='"+loginname+"'");
			if(rs.next())
			{
				acdto = new Acadamic();
			    acdto.setYearofpass1(rs.getInt(1));
			    acdto.setPercentage1(rs.getDouble(2));
			    acdto.setYearofpass2(rs.getInt(3));
			    acdto.setPercentage2(rs.getDouble(4));
			    acdto.setYearofpass3(rs.getInt(5));
			    acdto.setPercentage3(rs.getDouble(6));
			    acdto.setRollno(rs.getString(7));
			    acdto.setYearofjoining(rs.getInt(8));
			    acdto.setCourse(rs.getString(9));
			    acdto.setDiscipline(rs.getString(10));
			    acdto.setSemister(rs.getString(11));
			    acdto.setLoginname(loginname);
			}
		}
		catch(SQLException sex)
		{
			LoggerManager.writeLogSevere(sex);
		}
		return acdto;
	}
	
	//Updating acadamic details
	public boolean updateAcadamicDetails(Acadamic adto)
	{
		Statement st;
		boolean flag = false;
		
		try {
			String loginname = adto.getLoginname();
            int yearofpass1 = adto.getYearofpass1();
            double percentage1 = adto.getPercentage1(); 
            int yearofpass2 = adto.getYearofpass2();
            double percentage2 = adto.getPercentage2();
            int yearofpass3 = adto.getYearofpass3();
            double percentage3 = adto.getPercentage3();
            String rollno = adto.getRollno();
            int yearofjoin = adto.getYearofjoining();
            String course = adto.getCourse();
            String discipline = adto.getDiscipline();
            String semister = adto.getSemister();
              
              PreparedStatement pst = con.prepareStatement("update ACADAMICDETAILS set sscyop=?,sscpercentage=?,ugyop=?,ugpercentage=?,gyop=?,gpercentage=?,rollno=?,yearofjoining=?,course=?,discipline=?,semister=? where loginname=?");
              
              pst.setInt(1, yearofpass1);
              pst.setDouble(2, percentage1);
              pst.setInt(3, yearofpass2);
              pst.setDouble(4, percentage2);
              pst.setInt(5, yearofpass3);
              pst.setDouble(6, percentage3);
              pst.setString(7, rollno);
              pst.setInt(8, yearofjoin);
              pst.setString(9, course);
              pst.setString(10, discipline);
              pst.setString(11, semister);
              pst.setString(12, loginname);
              
              int i=pst.executeUpdate();
              if(i!=0)
              {
            	  flag = true;
              }
		}
		catch(Exception e)
		{
			LoggerManager.writeLogSevere(e);
		}
		return flag;
	}
	
	
	//Getting profiles
    public CoreHash getProfile(String role)
    {
    	Acadamic rb=null;
    	CoreHash aCoreHash = new CoreHash();
        try
        {
        	con=getConnection();
           Statement st = con.createStatement();
          /* ResultSet rs = st.executeQuery("select ld.loginname,ac.course,ac.discipline,ac.semister,ac.rollno,ag.aggregate " +
           								  "from logindetails ld, acadamicdetails ac , aggregates ag where " +
           								  "ld.logintype='"+role+"' and ac.loginname=ld.loginname and ld.loginstatus=1 and ag.loginname=ld.loginname");*/
           ResultSet rs=st.executeQuery("select *From acadamicdetails");
           String loginname = "";
           while(rs.next())
           {
        	   rb=new Acadamic();
        	   loginname = rs.getString(1);
        	   rb.setLoginname(loginname);
        	   rb.setCourse(rs.getString(10));
        	   rb.setDiscipline(rs.getString(11));
        	   rb.setSemister(rs.getString(12));
        	   rb.setRollno(rs.getString(8));
        	   rb.setAggregate(rs.getDouble(7));
        	   aCoreHash.put(loginname, rb);
           }
           con.close();
        }
        catch(Exception e)
        {
        	LoggerManager.writeLogSevere(e);
        }
        return aCoreHash;
    } 
    
    
  //Getting profiles
    public CoreHash getProfile(String course, String discipline, String semister)
    {
    	Acadamic rb=null;
    	CoreHash aCoreHash = new CoreHash();
        try
        {
        	con=getConnection();
           Statement st = con.createStatement();
           ResultSet rs = st.executeQuery("select ld.loginname,ac.course,ac.discipline,ac.semister,ac.rollno,ag.aggregate   " +
           								  "from logindetails ld, acadamicdetails ac, aggregates ag where " +
           								  "ac.loginname=ld.loginname and ld.loginstatus=1 and ac.course='"+course+"' " +
           								  "and ac.discipline='"+discipline+"' and ac.semister='"+semister+"' and ag.loginname=ld.loginname");
           //and " +
           	//							  "ag.aggregate>=0 and ld.loginname not in (select loginname from " +
           		//						  " placements where status='Recruited')");
           String loginname = "";
           while(rs.next())
           {
        	   rb=new Acadamic();
        	   loginname = rs.getString(1);
        	   rb.setLoginname(loginname);
        	   rb.setCourse(rs.getString(2));
        	   rb.setDiscipline(rs.getString(3));
        	   rb.setSemister(rs.getString(4));
        	   rb.setRollno(rs.getString(5));
        	   rb.setAggregate(rs.getDouble(6));
        	   aCoreHash.put(loginname, rb);
           }
           con.close();
        }
        catch(Exception e)
        {
        	LoggerManager.writeLogSevere(e);
        }
        return aCoreHash;
    } 
    
  //Getting profiles
    public CoreHash getProfile(String course, String discipline, String semister , String percentage)
    {
    	Acadamic rb=null;
    	CoreHash aCoreHash = new CoreHash();
        try
        {
        	con=getConnection();
           Statement st = con.createStatement();
          
           ResultSet rs = st.executeQuery("select ld.loginname,ac.course,ac.discipline,ac.semister,ac.rollno,ag.aggregate  " +
           								  "from logindetails ld, acadamicdetails ac, aggregates ag where " +
           								  "ac.loginname=ld.loginname and ld.loginstatus=1 and ac.course='"+course+"' " +
           								  "and ac.discipline='"+discipline+"' and ac.semister='"+semister+"' and " +
           								  "ag.aggregate>="+percentage+" and ld.loginname not in (select loginname from " +
           								  " placements where status='Recruited') and ag.loginname=ld.loginname");
           String loginname = "";
           while(rs.next())
           {
        	   rb=new Acadamic();
        	   loginname = rs.getString(1);
        	   rb.setLoginname(loginname);
        	   rb.setCourse(rs.getString(2));
        	   rb.setDiscipline(rs.getString(3));
        	   rb.setSemister(rs.getString(4));
        	   rb.setRollno(rs.getString(5));
        	   rb.setAggregate(rs.getDouble(6));
        	  
        	   aCoreHash.put(loginname, rb);
           }
           con.close();
        }
        catch(Exception e)
        {
        	LoggerManager.writeLogSevere(e);
        }
        return aCoreHash;
    } 
}
