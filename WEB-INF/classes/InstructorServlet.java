package com.ooad;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import org.json.simple.*;
import java.util.*;
import java.sql.*;


public class InstructorServlet extends HttpServlet{

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
        String name=request.getParameter("name");
        switch(type){
          case "first":{
            Thread.sleep(1000);
            query="select * from instructor where name='"+name+"'";
            ResultSet rs=stmt.executeQuery(query);
            JSONArray temp=new JSONArray();
            
            //temp.add(rs.getMetaData().getColumnCount());
            
            rs.next();
            for(int i=1;i<5;i++){
              if(rs.getString(i)!=null)
              {
                String toAdd="";
                toAdd+=rs.getMetaData().getColumnName(i);
                toAdd+=": "+rs.getString(i);
                temp.add(toAdd);
              }
            }
            json.put("details",temp);
           break;
          }
          case "semesterUpdate":{
            String ooad=request.getParameter("ooad");
            String ml=request.getParameter("ml");
            Float ooadF=Float.parseFloat(ooad);
            Float mlF=Float.parseFloat(ml);
            String backlog="";
            if(ooadF<33){
              backlog+="ooad ";
            }
            if(mlF<33){
              backlog+="ml";
            }
            Float gpa=((ooadF*26)+(mlF*24))/500;
            query="update student set ooad='"+ooad+"',ml='"+ml+"',gpa='"+gpa+"',backlog='"+backlog+"' "
                  +"where name='"+name+"'";
            int rows=stmt.executeUpdate(query);
            json.put("rows",rows);
          }
        }

 

      
      

      Enumeration eNum=request.getParameterNames();
      while(eNum.hasMoreElements()){
        String parName=(String)eNum.nextElement();
        json.put(parName,request.getParameter(parName));
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
