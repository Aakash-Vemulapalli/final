package DAO.dao;
import DTO.dto.*;
import UTILITY.utility.*;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class maindao 
{
	int i=0;
	
//===========================Inserting Data=========================================
	public int insert(maindto dto, String pass)
	{
		 dbconnection db = new dbconnection();
		   Connection c = db.getconnection();
		   String pa =encryp(pass);
		   dto.setPass(pa);
		   dto.setUimage("/dummy_user.jpg");
		   
		  
		try
		{  String sql1 = "Select max(id) from login";
		   PreparedStatement ps1 = c.prepareStatement(sql1);
		   ResultSet rs=ps1.executeQuery();	
			if (rs.next())
			{
				
			   String A=rs.getString(1);
			   
			   int a= Integer.parseInt(A);
			   int b =a+1;
			   String S=Integer.toString(b);
			   System.out.println("valuees"+a+""+b+""+S);
			   dto.setId(S);
			   String sql = "insert into login values(?,?,?,?,?)";
			   PreparedStatement ps = c.prepareStatement(sql);
			   ps.setString(1,dto.getId());
			   ps.setString(2,dto.getName());
			   ps.setString(3,dto.getPass());
			   ps.setString(4, dto.getType());
			   ps.setString(5, dto.getUimage());
			   i=ps.executeUpdate();
			   return i;
			}
		}
		catch (Exception e)
		{
			System.out.println("in DAO file");
			e.printStackTrace();
		}
		finally
		{
			db.closeConnection();
		}
		
		return i;
	}
	
	public String login(maindto dto)
		{	
		String p;
		try{
			
		 	dbconnection db = new dbconnection();
		 	Connection c = db.getconnection();
		 	System.out.println(dto.getName());
		 	System.out.println(dto.getPass());;
		 	PreparedStatement ps=c.prepareStatement("select type from login where email=? and password=? ");
		 	System.out.println("k it got executeed ");
	    	ps.setString(1, dto.getName());
	    	ps.setString(2, dto.getPass());
	    	ResultSet rs=ps.executeQuery();
	    	if(rs.next())
	    	{
	    		 p=rs.getString("type");
	    		 System.out.println(p);
	    		 return p;
	    	}
		}
		catch(Exception e)
	    	{
	    	e.printStackTrace(); 
	    	}
			return p="nouser";
		}
	
	
	public List<maindto> udate(maindto dto)
	{
		dbconnection db = new dbconnection();
	 	Connection con = db.getconnection();
		
	
		ArrayList<maindto> list = new ArrayList<maindto>();
		
		try
		{	
				System.out.println("show all function");
				String sql="select * from login where email=?";		
				System.out.println("query applied :"+sql);
				PreparedStatement ps=con.prepareStatement(sql);
				ps.setString(1, dto.getName());
				ResultSet rs=ps.executeQuery();
				System.out.println("execute query now");
				if(rs.next())
			{
				System.out.println("in function ");
				dto.setId(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setPass(rs.getString(3));
				dto.setType(rs.getString(4));
				dto.setUimage(rs.getString(5));
								
				list.add(dto);
				System.out.println("end show function");
				
			}
			else
			{
				System.out.println("error");
			}
				
		}
		
		catch(Exception e)
		{ 
			System.out.println("Exception "+e);
		}
		
	return list;
	
	}
	
	public ArrayList<maindto> image(maindto dto)
	{
		int i=0;
		dbconnection db = new dbconnection();
	 	Connection con = db.getconnection();
		ArrayList<maindto> list = new ArrayList<maindto>();
		
		try
		{	
				System.out.println("image function");
				String sql="update login set u_image=? where email=?";		
				System.out.println("query applied :"+sql);
				PreparedStatement ps=con.prepareStatement(sql);
				ps.setString(1, dto.getUimage());
				ps.setString(2, dto.getName());
				i=ps.executeUpdate();
				System.out.println("execute query now");
				if(i==1)
				{
					
					String sql1="select * from login where email=?";		
					System.out.println("query applied :"+sql1);
					PreparedStatement ps1=con.prepareStatement(sql1);
					ps1.setString(1, dto.getName());
					ResultSet rs=ps1.executeQuery();
					System.out.println("execute query now");	
					if(rs.next())
					{
				System.out.println("in function ");
				dto.setId(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setPass(rs.getString(3));
				dto.setType(rs.getString(4));
				dto.setUimage(rs.getString(5));	
				list.add(dto);
				System.out.println("end show function");
					}
				}
			else
			{
				System.out.println("error");
			}
		}
		catch(Exception e)
		{ 
			System.out.println("Exception "+e);
		}
		
	return list;
	
	}
	
	public  String encryp(String p){
	    	try{
	       
	        MessageDigest m=MessageDigest.getInstance("MD5");
	        m.update(p.getBytes(),0,p.length());
	        String k=new BigInteger(1,m.digest()).toString(16);
	        System.out.println("MD5: "+k);
	        return k;
	    	}catch(Exception e){
	    		System.out.println("the exception in encryption    : "+e);
	    	}
	    	return "a";
	    }
}
	