package com.tarena.util;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

public class PrintWriterUtil {
	public static void printMessageToClient(HttpServletResponse response,
			                                String message){
		try{
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out=response.getWriter();
			out.print(message);
			out.flush();
			out.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}
