<%@page import="java.sql.*" %>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>

<%
String vname=request.getParameter("sr");
String brand=request.getParameter("tid");
String mileage=request.getParameter("name");
String engine=request.getParameter("mail");
String type=request.getParameter("amount");


//String date= (new java.util.Date()).toLocaleString();
%>
<%
try{
            Connection con=null;
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("Driver class loaded");
			con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","mani","mani");
			System.out.println("connection");
			
			PreparedStatement psmt=con.prepareStatement("insert into viewcust values(?,?,?,?,?)");
			psmt.setString(1,vname);
		psmt.setString(2,brand);
		psmt.setString(3,mileage);
		psmt.setString(4,engine);
		psmt.setString(5,type);
	
		
	
		//psmt.setString(7,date);
		int n=psmt.executeUpdate();
		if(n>0)
		{            
		
			out.println("<h1 align='center'>Mentor Addded Successfully</h1>");
			RequestDispatcher rd=request.getRequestDispatcher("customer.html");
			rd.include(request, response);
			
		}
		else
		{
			response.sendRedirect("customer.html");
		
		}
}
catch(Exception e)
{
	out.println(e);
}
		%>