package com.cal.util;
import java.util.Date;
import java.util.Timer;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import com.cal.quartz.MyTimerTask;

public class ExchageRate{

//	public static void main(String[] args) {
//		
//		 Timer timer = new Timer();
//		 Date date= new Date();
//		 timer.schedule(new MyTimerTask(),date,24*60*60*1000);
//			
//	}
	
	
	public class AutoRun implements ServletContextListener {  
	      
	    private Timer timer = null;  
	  
	    public void contextInitialized(ServletContextEvent arg0) {   
	        timer=new Timer(true);  
	        Date date= new Date();
	        timer.schedule(new MyTimerTask(),date,24*60*60*1000);//每天执行一次MyTimerTask()  
	    }  
	      
	    public void contextDestroyed(ServletContextEvent arg0) {  
	        timer.cancel();  
	    }  
	  
	}  
}
