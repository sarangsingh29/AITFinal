package com.ooad;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import org.json.simple.*;
import java.util.*;
import java.sql.*;


public class LoginServlet extends HttpServlet{

	public void init(){
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response){
		
		try{
				/*Maverick:
				  Connect to database and validate the login.*/

				/*Database code*/
	            
		        String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
		        String DB_URL = "jdbc:mysql://localhost/sample";
		        String USER = "maverick";
		        String PASS = "mav";
		        Class.forName(JDBC_DRIVER);
		        Connection conn=DriverManager.getConnection(DB_URL,USER,PASS);
		        Statement stmt=conn.createStatement();
		        
		        /*-------------*/

		        JSONObject json=new JSONObject();
		        response.setContentType("application/json");
		        response.setCharacterEncoding("UTF-8");
		      
		      	String query="";
				String type=request.getParameter("type");
				String name=request.getParameter("username");
				String pwd=request.getParameter("password");

				Enumeration eNum=request.getParameterNames();
		        while(eNum.hasMoreElements()){
		        	String parName=(String)eNum.nextElement();
		        	json.put(parName,request.getParameter(parName));
		      	}
	   	        
				String baseUrl="";
				switch(type){
					case "student":baseUrl="studentPage.jsp?name="; break;
					case "secretary":baseUrl="secretaryPage.jsp?name="; break;
					case "instructor":baseUrl="instructorPage.jsp?name="; break;
				}

				query="select * from login where username='"+name+"'";
				ResultSet rs=stmt.executeQuery(query);
				if(rs.next()==false)
					json.put("success","0");
				else
					if(!(name.equals(rs.getString(1)) && pwd.equals(rs.getString(2))))
						json.put("success","0");
					else
						if(!type.equals(rs.getString(3))){
							json.put("success","1");
						}
						else
						{
							json.put("success","2");
							baseUrl+=rs.getString(1);
							json.put("url",baseUrl);
						}
				response.getWriter().print(json);
			}
		
		catch(Exception e){
	      JSONObject json=new JSONObject();
	      json.put("error","error");
	      try{
	        response.getWriter().print(json);
	      }
	      catch(Exception e1){
	        
	      }
	    }
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response){
		doPost(request,response);
	}
}
