package com.ooad;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import org.json.simple.*;
import java.util.*;


public class StudentDisplayServlet extends HttpServlet{

	public void init(){
	
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response){
		
		try{
			/*Maverick:
			Connect to database and send all the values back as JSON.*/
			response.setContentType("application/json");
    		response.setCharacterEncoding("UTF-8");
			JSONObject json=new JSONObject();
			json.put("name","Hell");
			json.put("id","Kill");
			response.getWriter().println(json);
		}
		catch(Exception e){

		}
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response){
		doPost(request,response);
	}
}
