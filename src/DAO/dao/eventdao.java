package DAO.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import DTO.dto.e_book;
import DTO.dto.eventdto;
import UTILITY.utility.dbconnection;
public class eventdao {
int i=0;
	
	public int C_insert(eventdto dto)
	{
		dbconnection db = new dbconnection();
	 	Connection c = db.getconnection();
	 	String id=String.valueOf(1 );
	 	System.out.println("event insert");
		
	 	dto.setEid(id);
		try
		{
			   String sql1="select max(eventid) from event";
			   PreparedStatement ps1=c.prepareStatement(sql1);
			   ResultSet rs=ps1.executeQuery();
			   if(rs.next())
			   {
				String id1=rs.getString(1);
				int a=Integer.parseInt(id1);
				int a1=a+1;
				String a2=Integer.toString(a1);
				dto.setEid(a2);
			    System.out.println("event in try");
			    String sql = "insert into event values(?,?,?,?,?)";
			    PreparedStatement ps = c.prepareStatement(sql);
			    ps.setString(1,dto.getEid());
			    ps.setString(2,dto.getEname());
			    ps.setString(3,dto.getEvenue());
			    ps.setString(4, dto.getEdate());
			    ps.setString(5, dto.getEtickets());
			  
			    i=ps.executeUpdate();
			   return 1; 
			   }
		}	   
		catch (Exception e)
		{
			System.out.println("show eventdao");
			e.printStackTrace();
		}
		finally
		{
			db.closeConnection();
		}
		
		return i;
	}
	public int Devent(eventdto dto)
	{
		dbconnection db = new dbconnection();
	 	Connection c = db.getconnection();
		System.out.println("event delete");
		
		try
		{
			   System.out.println("event in try");
			   String sql = "delete from event  where eventid=? ";
			   PreparedStatement ps = c.prepareStatement(sql);
			   ps.setString(1,dto.getEid());
			   System.out.println("in eventdao of delete "+dto.getEid()+" "+dto.getEname());
			   
			   i=ps.executeUpdate();
			   System.out.println("i=="+i);
			   if (i==1)
			   {
				   
			   db.closeConnection();
			   return i;
			   }
		}
		catch (Exception e)
		{
			System.out.println("in eventdao of delete ");
			e.printStackTrace();
		}
		
		return 0;
	}
	
	public List<eventdto> udat(eventdto dto1)
	{
		dbconnection db = new dbconnection();
	 	Connection con = db.getconnection();
		
		
		ArrayList<eventdto> list = new ArrayList<eventdto>();
		
		try
		{	
			System.out.println("show all function");
			
			String sql="select * from event";		
			System.out.println("query applied :"+sql);
			PreparedStatement ps=con.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			System.out.println("execute query now");
			while(rs.next())
			{
				eventdto dto= new eventdto();
				System.out.println("in function ");
				dto.setEid(rs.getString(1));
				dto.setEname(rs.getString(2));
				dto.setEvenue(rs.getString(3));
				dto.setEdate(rs.getString(4));
				dto.setEtickets(rs.getString(5));				
				list.add(dto);
				System.out.println("end show function");
				
				
			}
				
		}
		
		catch(Exception e)
		{ 
			System.out.println("Exception "+e);
		}
		
	return list;
	
	}
	public List<eventdto> Show(eventdto dto1)
	{
		dbconnection db = new dbconnection();
	 	Connection con = db.getconnection();
		
		
		ArrayList<eventdto> list = new ArrayList<eventdto>();
		
		try
		{	
			System.out.println("show all function");
			
			String sql="select * from event";		
			System.out.println("query applied :"+sql);
			PreparedStatement ps=con.prepareStatement(sql);
				
			ResultSet rs=ps.executeQuery();
			System.out.println("execute query now");
			while(rs.next())
			{
				eventdto dto= new eventdto();
				System.out.println("in function ");
				dto.setEid(rs.getString(1));
				dto.setEname(rs.getString(2));
				dto.setEvenue(rs.getString(3));
				dto.setEdate(rs.getString(4));
				dto.setEtickets(rs.getString(5));				
				list.add(dto);
				System.out.println("end show function");
				
				
			}
				
		}
		
		catch(Exception e)
		{ 
			System.out.println("Exception "+e);
		}
		
	return list;
	
	}

	public ArrayList<eventdto> ret(eventdto dto)
	{
		dbconnection db = new dbconnection();
	 	Connection con = db.getconnection();
	 	
	 	try
	 	{	
	 		ArrayList<eventdto> list = new ArrayList<eventdto>();
	 		eventdto dt=new eventdto();
	 		System.out.println("dto value  :"+dto.getEid());
	 		System.out.println("show all function");
			String sql="select * from event where eventid=?";		
			System.out.println("query applied :"+sql);
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, dto.getEid());
			ResultSet rs=ps.executeQuery();
			System.out.println("execute query now");
			if(rs.next())
	 		{
	 		System.out.println("in function ");
		   	dt.setEid(rs.getString(1));
		   	dt.setEname(rs.getString(2));
		   	dt.setEvenue(rs.getString(3));
		   	dt.setEdate(rs.getString(4));
		   	dt.setEtickets(rs.getString(5));
		   	list.add(dt);
		   	return list;
	 		}
	 	}
	 	catch(Exception e)
		{ 	
	 		
			System.out.println("Exception "+e);
		}
	return null; 	
	}
	
	public ArrayList<e_book> bok(eventdto dto,e_book dto1)
	{
		dbconnection db = new dbconnection();
	 	Connection con = db.getconnection();
		
		int i=0;
		ArrayList<e_book> list = new ArrayList<e_book>();
		
		try
		{	
			System.out.println("book function");	
			System.out.println(dto1.getEname());
			System.out.println(dto1.getEtb());
			System.out.println(dto1.getUname());	
			String sql="update event set etickets=? where eventid=?";		
			System.out.println("query applied :"+sql);
			PreparedStatement ps=con.prepareStatement(sql);			
			ps.setString(1,dto.getEtickets());
			ps.setString(2,dto.getEid());
			   i=ps.executeUpdate();
			   System.out.println(1);	
			   if(i==1)
			   		{
				   
			   		String Sql2="Select max(order_id) from e_booking";
			   		PreparedStatement ps2=con.prepareStatement(Sql2);
			   		ResultSet rs=ps2.executeQuery(Sql2);
			   		if(rs.next())
			   		{
			   			System.out.println("here e");	
			   			String Order=rs.getString(1);
			   			int l=Integer.parseInt(Order);
			   			int k=l+1;
			   			String Odr=Integer.toString(k);
			   			System.out.println("odr:"+Odr);
			   			dto1.setOrder(Odr);
			   		}
			   					   	
			   		System.out.println(dto1.getOrder());
				   	String sql1="insert into e_booking values (?,?,?,?,?)";		
					System.out.println("query applied :"+sql1);
					PreparedStatement ps1=con.prepareStatement(sql1);
					ps1.setString(1,dto1.getOrder());
					ps1.setString(2,dto1.getEventid());
					ps1.setString(3,dto1.getEname());
					ps1.setString(4,dto1.getUname());
					ps1.setString(5, dto1.getEtb());
					int k=ps1.executeUpdate();
			   		System.out.println("execute query now");
			   		if(k==1)
			   		{
			   			String sql2="Select * from e_booking where order_id=? and email=? ";
			   			PreparedStatement ps3=con.prepareStatement(sql2);
			   			ps3.setString(1,dto1.getOrder());
			   			ps3.setString(2,dto1.getUname());
			   			ResultSet rs1=ps3.executeQuery();
			   			if(rs1.next())
				   		{
					   	System.out.println("in function ");
					   	dto1.setOrder(rs1.getString(1));
					   	dto1.setEventid(rs1.getString(2));
					   	dto1.setEname(rs1.getString(3));
					   	dto1.setUname(rs1.getString(4));
					   	dto1.setEtb(rs1.getString(5));
					   	list.add(dto1);
					   	System.out.println("end show function");
					   	return list;
				   		}
				
				
			   		}
			   
			   	}   
			  }
		catch(Exception e)
		{ 
			System.out.println("Exception "+e);
		}
		
		return list;
	
	}
	
}
	

