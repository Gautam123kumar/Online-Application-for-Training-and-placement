package com.dts.tpo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.dts.core.dao.AbstractDataAccessObject;
import com.dts.core.util.CoreHash;
import com.dts.core.util.LoggerManager;
import com.dts.tpo.model.Aggregates;
import com.dts.tpo.model.Skill;

public class SkillDAO extends AbstractDataAccessObject {

	Connection con;
	CoreHash aCoreHash ;
    CoreHash tCoreHash ;
    Skill aSkill;
	
	public void setSkill(Skill aSkill)
	{
		try
		{
			con = getConnection();
			PreparedStatement pst = con.prepareStatement("insert into studentskills values(?,?,?,?)");
			pst.setString(1, aSkill.getLoginname());
			pst.setString(2, aSkill.getSkillname());
			pst.setString(3, aSkill.getDescription());
			pst.setString(4, aSkill.getLevel());
			
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
	
	
	public void updateSkill(Skill aSkill)
	{
		try
		{
			con = getConnection();
			PreparedStatement pst = con.prepareStatement("update studentskills set description=?, leveldesc=?  where loginname=? and skillname=?");
			
			pst.setString(1, aSkill.getDescription());
			pst.setString(2, aSkill.getLevel());
			pst.setString(3, aSkill.getLoginname());
			pst.setString(4, aSkill.getSkillname());
			
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
	
	
	public void deleteSkill(Skill aSkill)
	{
		try
		{
			con = getConnection();
			PreparedStatement pst = con.prepareStatement("delete from  studentskills where loginname=? and skillname=?");
			
			pst.setString(1, aSkill.getLoginname());
			pst.setString(2, aSkill.getSkillname());
			
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
	
	
	public CoreHash getSkills(String loginname)
	{
		try
		{
	         con = getConnection();		
	         Statement st = con.createStatement();
	         ResultSet rs = st.executeQuery("select * from studentskills where loginname='"+loginname+"'");
	         aCoreHash = new CoreHash();
	         tCoreHash = new CoreHash();
	         
	         int i = 1;
	         while(rs.next())
	         {
	            aSkill = new Skill();
	            
	            aSkill.setSkillname(rs.getString(2));
	            aSkill.setDescription(rs.getString(3));
	            aSkill.setLevel(rs.getString(4));
	            aCoreHash.put(new Integer(i), aSkill);
	            i++;
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
	
}
