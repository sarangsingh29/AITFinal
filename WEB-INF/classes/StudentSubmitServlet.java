package com.ooad;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;


public class StudentSubmitServlet extends HttpServlet{

	public void init(){
	
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response){
		
		try{
			/*Maverick:
			Connect to server and save the values
			and write the success message on the page.*/
			
		}
		catch(Exception e){

		}
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response){
		doPost(request,response);
	}
}
