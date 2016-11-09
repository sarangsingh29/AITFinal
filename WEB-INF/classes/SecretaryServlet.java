package com.ooad;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import org.json.simple.*;
import java.util.*;
import java.sql.*;


public class SecretaryServlet extends HttpServlet{

	public void init(){
	
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response){
		
		try{
			/*Maverick:
			Secretary page.*/

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
  			switch(type){
  				case "first":{
            Thread.sleep(1000);
  					query="select * from finance";
  					ResultSet rs=stmt.executeQuery(query);
  					JSONArray temp=new JSONArray();
  					while(rs.next()){
  						temp.add(rs.getString(1)+":"+rs.getFloat(2));
  					}
  					json.put("finance",temp);


  					query="select * from inventory";
  					rs=stmt.executeQuery(query);	
  					temp=new JSONArray();
  					
  					while(rs.next()){
  						temp.add(rs.getString(1)+": "+rs.getInt(2));
  					}
  					json.put("inventory",temp);


  					query="select * from academic";
  					rs=stmt.executeQuery(query);	
  					temp=new JSONArray();
  					
  					while(rs.next()){
  						temp.add(rs.getString(1)+":"+rs.getString(2));
  					}
  					json.put("academic",temp);

  					temp=new JSONArray();
  					temp.add("Dept_Name: Computer Science and Engineering");
  					temp.add("HoD: Dr. Renuka Prabhu");
  					temp.add("Phone: (+91)9663587900");

  					json.put("department",temp);
  					break;
  				}
  				case "inventory":{
  					String item=request.getParameter("item");
  					String qty=request.getParameter("qty");
  					String price=request.getParameter("price");
  					query="update inventory set quantity=quantity+"+qty+" where item='"+item+"'";
  					int rows=stmt.executeUpdate(query);
  					json.put("rows",rows);
  					break;
  				}
  				case "finance":{
  					String donor=request.getParameter("donor");
  					String amt=request.getParameter("amount");
  					query="insert into finance values('"+donor+"',"+amt+")";
  					int rows=stmt.executeUpdate(query);
  					json.put("rows",rows);
  					break;
  				}
  				case "academic":{
  					String title=request.getParameter("title");
  					String author=request.getParameter("author");
  					query="insert into academic values('"+title+"','"+author+"')";
  					int rows=stmt.executeUpdate(query);
  					json.put("rows",rows);
  					break;
  				}
  				case "student":{
  					String name=request.getParameter("name");
  					String appNum=request.getParameter("appNum");
  					String phone=request.getParameter("phone");
  					query="insert into student values('"+name+"',"+appNum+",'"+phone+"',null,null,null,null)";
  					int rows=stmt.executeUpdate(query);
  					json.put("rows",rows);
  					break;
  				}
  			}

 

			
			

			Enumeration eNum=request.getParameterNames();
			while(eNum.hasMoreElements()){
				String name=(String)eNum.nextElement();
				json.put(name,request.getParameter(name));
			}

			
			response.getWriter().println(json);
			conn.close();
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
