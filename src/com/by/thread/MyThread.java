package com.by.thread;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.socket.TextMessage;

import com.by.entity.User;
import com.by.service.UserService;
import com.by.service.impl.UserServiceImpl;
import com.by.socket.MsgScoketHandler;

//import com.by.socket.WebSocketServlet;
//@Controller
public class MyThread implements Runnable{
//	@Autowired
//	@Qualifier("userService")
//	private UserService userService;
	private UserService userService;
	private User user;
	private int oldCounts;
	private int newCounts;
	private boolean stopMe = true;  
    public void stopMe() {  
        stopMe = false;  
    } 
    public void startMe(){
    	stopMe = true;
    }
    
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	@Override
	public void run() {
			 	
		oldCounts = userService.getAllCountsOfReview();		
		System.out.println(oldCounts);
		MsgScoketHandler msgSocketHandler = new MsgScoketHandler();				
		while(stopMe){						
			System.out.println("旧"+oldCounts);			
			int newCounts = userService.getAllCountsOfReview();
			System.out.println("新"+newCounts);
			//oldCounts != newCounts
			if(oldCounts != newCounts){
				oldCounts = newCounts;
				TextMessage textMessage = new TextMessage("有新的回复！");
				//msgSocketHandler.sendMessageToUsers(textMessage);	
				msgSocketHandler.sendMessageToUser(user, textMessage);
			}
			try {
				Thread.sleep(5000);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}
