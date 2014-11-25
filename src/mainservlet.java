
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import DAO.dao.eventdao;
import DAO.dao.maindao;
import DTO.dto.e_book;
import DTO.dto.eventdto;
import DTO.dto.maindto;


public class mainservlet extends HttpServlet {
	
	
    
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{	System.out.println("doget");
		
		String  uname = request.getParameter("uname");
		String upass= request.getParameter("upass");
		String eid=request.getParameter("eid");
		String ename=request.getParameter("E_name");
		String evenue=request.getParameter("E_venue");
		String edate=request.getParameter("E_date");
		String etick=request.getParameter("E_tickets");
		String btic=request.getParameter("btic");
		String hv =request.getParameter("cb");
		String del=request.getParameter("Did");
		String uimg=request.getParameter("uimage");
		System.out.println("this is image add"+uimg);
		System.out.println("this is HV"+hv);
		if(request.getParameter("insert")!=null)
		{
			insert(request, response, uname, upass);
		}
		if(request.getParameter("uib")!=null)
		{
			image(request,response,uimg,hv);
		}
		if(request.getParameter("reg")!=null)
		{
			response.sendRedirect("http://localhost:8081/final/JSP/home.jsp");
		}
		if(request.getParameter("login")!=null)
		{
			login(request, response, uname, upass);
		}
		
		if (request.getParameter("C_event")!=null)
		{
			response.sendRedirect("http://localhost:8081/final/JSP/a_cevent.jsp");
		}
		
		else if(request.getParameter("D_event")!=null)
		{
			response.sendRedirect("http://localhost:8081/final/JSP/ad_event.jsp");
		}
		else if(request.getParameter("cevent")!=null)
		{
			C_event(request,response,ename,evenue,edate,etick,hv);
		}
		else if(request.getParameter("devent")!=null)
		{
			D_event(request,response,del,ename,hv);
		}
		else if(request.getParameter("S_event")!=null)
		{
			S_event(request,response,hv);
		}
		else if(request.getParameter("book1")!=null)
		{
			Book(request,response,eid,ename,etick,btic,hv);
			
			
		}
		else if(request.getParameter("Logout")!=null)
		{	
			HttpSession ses=request.getSession(true); 
			ses.setAttribute("username",null);
			response.sendRedirect("http://localhost:8081/final/JSP/login.jsp");
			
		}
		else if(request.getParameter("book")!=null)
		{
			b(request,response,hv,eid,ename);

		}
		else if (request.getParameter("Up_event")!=null)
		{
			System.out.println("here at uprofile");
			uprofile(request,response,hv);
			
			}
		else if (request.getParameter("Db_event")!=null)
		{
			{
				
				Sh_event(request,response,hv);
				
				}
			
			}
		else if (request.getParameter("Us_event")!=null)
		{
			
			Sh_event(request,response,hv);
			
			}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
			
		System.out.println("servlet");
		doGet(request, response);
	}
	public void b(HttpServletRequest request, HttpServletResponse response,String hv,String eid,String ename) throws IOException
	{	
		try
		{
		eventdao dao=new eventdao();
		eventdto dto=new eventdto();
		dto.setEid(eid);
		dto.setEname(ename);
		System.out.println(dto.getEid());
		ArrayList<eventdto> list=(ArrayList<eventdto>) dao.ret(dto);
		request.setAttribute("data", list);
		HttpSession session=request.getSession(true);
		session.setAttribute("obj", list);
		HttpSession ses=request.getSession(true);  //giving http session
		ses.setAttribute("username",hv);
		response.sendRedirect("http://localhost:8081/final/JSP/event_b.jsp");
		}
		catch(Exception e)
		{
			HttpSession ses=request.getSession(true);  //giving http session
			ses.setAttribute("username",null);
			response.sendRedirect("http://localhost:8081/final/JSP/ufailure.jsp");
		
		}
	}
	public void insert(HttpServletRequest request, HttpServletResponse response,String uname,String upass) throws ServletException, IOException
	{
		System.out.println("in insert");
		maindto dto = new maindto();
		dto.setName(uname);
	
		dto.setType("student");
		maindao dao = new maindao();
		int k=dao.insert(dto, upass);
		System.out.println("k"+k);
		if(k==1)
		{	
			HttpSession ses=request.getSession(true);  //giving http session
			ses.setAttribute("username",uname);
			response.sendRedirect("http://localhost:8081/final/JSP/mainhome.jsp");
			
			
		}
		else if(k==0)
		{

			HttpSession ses=request.getSession(true);  //giving http session
			ses.setAttribute("username",null);
			response.sendRedirect("http://localhost:8081/final/JSP/elogin.jsp");
		}
		else
		{

			HttpSession ses=request.getSession(true);  //giving http session
			ses.setAttribute("username",null);
			response.sendRedirect("http://localhost:8081/final/JSP/elogin.jsp");
			
		}
		
	}
	public void image(HttpServletRequest request, HttpServletResponse response,String uimg,String hv) throws IOException
	{	
		System.out.println("image insert");
		maindto dto = new maindto();
		maindao dao = new maindao();
		dto.setUimage(uimg);
		dto.setName(hv);
		
		try{
			ArrayList<maindto> list=(ArrayList<maindto>) dao.udate(dto);
			request.setAttribute("data", list);
			HttpSession session=request.getSession(true);
			session.setAttribute("obj", list);
			System.out.println("motuus");
			response.sendRedirect("http://localhost:8081/final/JSP/userprofile.jsp");
			}
			catch(Exception e)
			
			{

				HttpSession ses=request.getSession(true);  //giving http session
				ses.setAttribute("username",null);
				response.sendRedirect("http://localhost:8081/final/JSP/elogin.jsp");
			}

		}

	
	
	
	public void login(HttpServletRequest request, HttpServletResponse response,String uname,String upass) throws ServletException, IOException
	{
		System.out.println("hey login");
		maindao dao = new maindao();
		maindto dto = new maindto();
		dto.setName(uname);
		String dec=dao.encryp(upass);
		System.out.println("dec"+dec);
		dto.setPass(dec);
		String k=dao.login(dto);
		System.out.println("k "+k);
		if(k.equalsIgnoreCase("admin"))
		{
			System.out.println("k in admin");
			HttpSession ses=request.getSession(true);  //giving http session
			ses.setAttribute("username",uname);
			response.sendRedirect("http://localhost:8081/final/JSP/admin.jsp");
			System.out.println("admin");
			
		}
		else if(k.equalsIgnoreCase("student"))
		{
			HttpSession ses=request.getSession(true);  //giving http session
			ses.setAttribute("username",uname);
			response.sendRedirect("http://localhost:8081/final/JSP/mainhome.jsp");
			System.out.println("Student");
		
			
		}
		else if (k.equalsIgnoreCase("nouser"))
			{
			System.out.println("error directed here");
			response.sendRedirect("http://localhost:8081/final/JSP/elogin.jsp");
			}
		
		else
		response.sendRedirect("http://localhost:8081/final/JSP/elogin.jsp");
		return;
		
	}
	
	public void C_event(HttpServletRequest request, HttpServletResponse response,String ename,String evenue,String edate,String etick, String hv) throws ServletException, IOException
	
	{
		System.out.println("Create event ");
		eventdto dto = new eventdto();
		dto.setEname(ename);
		dto.setEvenue(evenue);
		dto.setEdate(edate);
		dto.setEtickets(etick);
		eventdao dao = new eventdao();
		int k=dao.C_insert(dto);


		if(k==1)
		{	
			HttpSession ses=request.getSession(true);  //giving http session
			ses.setAttribute("username",hv);
			response.sendRedirect("http://localhost:8081/final/JSP/success.jsp");
			
			
		}
		else if (k==0)
		{

			HttpSession ses=request.getSession(true);  //giving http session
			ses.setAttribute("username",hv);
			System.out.println("not inserted");
			response.sendRedirect("http://localhost:8081/final/JSP/failure.jsp");			
			
		}
		
		else
		{

			HttpSession ses=request.getSession(true);  //giving http session
			ses.setAttribute("username",null);
			response.sendRedirect("http://localhost:8081/final/JSP/elogin.jsp");
			
		}
	}
	public void D_event(HttpServletRequest request, HttpServletResponse response,String del,String ename,String hv) throws ServletException, IOException
	{
		eventdao dao = new eventdao();
		eventdto dto = new eventdto();
		dto.setEid(del);
		dto.setEname(ename);
		int k=dao.Devent(dto);
		System.out.println("k"+k);
		if(k==1)
			{	

			HttpSession ses=request.getSession(true);  //giving http session
			ses.setAttribute("username",hv);
			System.out.println("deleted");
			response.sendRedirect("http://localhost:8081/final/JSP/success.jsp");
				
				
			}
		else if(k==0)
			{	
			HttpSession ses=request.getSession(true);  //giving http session
			ses.setAttribute("username",hv);
			
			response.sendRedirect("http://localhost:8081/final/JSP/failure.jsp");
				
				
			}
		else
		{
			HttpSession ses=request.getSession(true);  //giving http session
			ses.setAttribute("username",null);
			response.sendRedirect("http://localhost:8081/final/JSP/elogin.jsp");
			
		}
		
	}
	
	public void S_event(HttpServletRequest request, HttpServletResponse response,String hv) throws ServletException, IOException
	{
		
	System.out.println("in show");
			
			eventdto dto=new eventdto();
			eventdao dao=new eventdao();
			try{
			List<eventdto> list=dao.udat(dto);
			request.setAttribute("data", list);
			HttpSession session=request.getSession(true);
			session.setAttribute("obj", list);
			System.out.println("motuus");
			HttpSession ses=request.getSession(true);  //giving http session
			ses.setAttribute("username",hv);
			response.sendRedirect("http://localhost:8081/final/JSP/as_all.jsp");
			}
			catch(Exception e)
			
			{	
				HttpSession ses=request.getSession(true);  //giving http session
				ses.setAttribute("username",null);
				response.sendRedirect("http://localhost:8081/final/JSP/elogin.jsp");}
	}
	public void Sh_event(HttpServletRequest request, HttpServletResponse response, String hv) throws ServletException, IOException
	{
		
	System.out.println("in show");
			
			eventdto dto=new eventdto();
			eventdao dao=new eventdao();
			try{
			List<eventdto> list=dao.Show(dto);
			request.setAttribute("data", list);
			HttpSession session=request.getSession(true);
			session.setAttribute("obj", list);
			session.setAttribute("username", hv);
			System.out.println("motuus");
			response.sendRedirect("http://localhost:8081/final/JSP/showevent.jsp");
			}
			catch(Exception e)
			
			
				{	

				HttpSession ses=request.getSession(true);  //giving http session
				ses.setAttribute("username",null);
				response.sendRedirect("http://localhost:8081/final/JSP/elogin.jsp");
				}
	}
	
	public void uprofile(HttpServletRequest request, HttpServletResponse response,String hv) throws IOException
	{	
		maindto dto=new maindto();
		maindao dao=new maindao();
		String h=hv;
		System.out.println("this is hV"+h);
		
		dto.setName(h);
		try{
			List<maindto> list=dao.udate(dto);
			request.setAttribute("data", list);
			HttpSession session=request.getSession(true);
			session.setAttribute("obj", list);
			session.setAttribute("username", h);
			System.out.println("motuus");
			response.sendRedirect("http://localhost:8081/final/JSP/userprofile.jsp");
	}
	catch(Exception e)
	
		{	

		HttpSession ses=request.getSession(true);  //giving http session
		ses.setAttribute("username",null);
		response.sendRedirect("http://localhost:8081/final/JSP/elogin.jsp");
		}
		
	}
	
	public void Book(HttpServletRequest request, HttpServletResponse response,String eid,String ename,String etick,String btic,String hv) throws ServletException, IOException
			{
				eventdto dto=new eventdto();
				e_book dto1=new e_book();
				eventdao dao=new eventdao();
				dto.setEid(eid);
				String a= btic;
				System.out.println(etick);
				System.out.println(btic);
				if(btic!=null)
				{
			
				int a1=Integer.parseInt(etick);
				int a2=Integer.parseInt(btic);
				int a3=a1-a2;
				dto.setEid(eid);
				dto.setEtickets(Integer.toString(a3));
				dto1.setEventid(eid);
				dto1.setEname(ename);
				dto1.setUname(hv);
				dto1.setEtb(btic);
				dto.setEname(ename);
				
				try{
				ArrayList<e_book> list=dao.bok(dto,dto1);
				request.setAttribute("data", list);
				HttpSession session=request.getSession(true);
				session.setAttribute("obj", list);
				session.setAttribute("username", hv);
				System.out.println("motuus");
				response.sendRedirect("http://localhost:8081/final/JSP/confirmation.jsp");
				}
				catch(Exception e)
				
				{	
					HttpSession ses=request.getSession(true);  //giving http session
					ses.setAttribute("username",null);
					response.sendRedirect("http://localhost:8081/final/JSP/elogin.jsp");
				}
				}
				else{
					HttpSession ses=request.getSession(true);  //giving http session
				ses.setAttribute("username",hv);
				response.sendRedirect("http://localhost:8081/final/JSP/ufailure.jsp");
				}
				
			}
			
		}
	
