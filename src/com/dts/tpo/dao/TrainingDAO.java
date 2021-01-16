package com.dts.tpo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.dts.core.dao.AbstractDataAccessObject;
import com.dts.core.util.CoreHash;
import com.dts.core.util.LoggerManager;
import com.dts.tpo.model.Training;

public class TrainingDAO extends AbstractDataAccessObject 
{
	Connection con = null;
	
	//new Training
	public void addTraining(Training aTraning)
	{	
		try
		{
			int trainingid = getSequenceID("Training", "trainingid");
	        con = getConnection();
	        PreparedStatement pst = con.prepareStatement("insert into training values(?,?,?,?,?,?)");
	        
	        pst.setInt(1, trainingid);
	        pst.setString(2, aTraning.getTrainingName());
	        pst.setString(3, aTraning.getTrainingDate());
	        pst.setString(4, aTraning.getTrainingtime());
	        pst.setString(5, aTraning.getDescription());
	        pst.setString(6, aTraning.getStatus());
	        
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
	
	
	//Update Training
	public void updateTraining(Training aTraning)
	{	
		try
		{
			con = getConnection();
	        PreparedStatement pst = con.prepareStatement("update training set trainingname=?,trainingdate=?,trainingtime=?,trainingdesc=?,status=? where trainingid=?");
	        
	        pst.setString(1, aTraning.getTrainingName());
	        pst.setString(2, aTraning.getTrainingDate());
	        pst.setString(3, aTraning.getTrainingtime());
	        pst.setString(4, aTraning.getDescription());
	        pst.setString(5, aTraning.getStatus());
	        pst.setInt(6, aTraning.getTrainingid());
	        
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
	
	
	//delete Training
	
	public void deleteTraining(int trainingid)
	{	
		try
		{
	        con = getConnection();	
	        Statement st = con.createStatement();
	        st.executeUpdate("delete from training where trainingid="+trainingid);
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
	
	
	//get Training Details
	
	public Training getTraining(int trainingid)
	{	
		Training training = null;
		try
		{
	        con = getConnection();
	        Statement st = con.createStatement();
	        ResultSet rs = st.executeQuery("select * from training where trainingid="+trainingid);
	        while(rs.next())
	        {
	        	training = new Training();
	        	training.setTrainingid(rs.getInt(1));
	        	training.setTrainingName(rs.getString(2));
	        	training.setTrainingDate1(rs.getDate(3));
	        	training.setTrainingtime(rs.getString(4));
	        	training.setDescription(rs.getString(5));
	        	training.setStatus(rs.getString(6));
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
		return training;
	}
	
//view Training Details
	
	public CoreHash getTrainings()
	{	
		Training training = null;
		CoreHash tCoreHash = new CoreHash();
		try
		{
			con = getConnection();
	        Statement st = con.createStatement();
	        ResultSet rs = st.executeQuery("select * from training");
	        int trainingid = 0;
	        while(rs.next())
	        {
	        	training = new Training();
	        	trainingid = rs.getInt(1);
	        	training.setTrainingid(trainingid);
	        	training.setTrainingName(rs.getString(2));
	        	training.setTrainingDate1(rs.getDate(3));
	        	training.setTrainingtime(rs.getString(4));
	        	training.setDescription(rs.getString(5));
	        	training.setStatus(rs.getString(6));
	        	
	        	tCoreHash.put(new Integer(trainingid), training);
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
}
