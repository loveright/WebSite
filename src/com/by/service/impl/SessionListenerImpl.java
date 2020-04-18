package com.by.service.impl;

import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import com.by.entity.User;

public class SessionListenerImpl implements HttpSessionListener{

	@Override
	public void sessionCreated(HttpSessionEvent httpSessionEvent) {
		// TODO Auto-generated method stub
		
	}
	//session监听器的作用是为了监听那些非正常退出系统的用户，清除登录信息用的。
	@Override
	public void sessionDestroyed(HttpSessionEvent httpSessionEvent) {
		// TODO Auto-generated method stub
		HttpSession session = httpSessionEvent.getSession();
		User user = (User) session.getAttribute("user");
		if (user != null) {
			ServletContext application = session.getServletContext();
			@SuppressWarnings("unchecked")
			Map<String, Object> loginMap = (Map<String, Object>) application.getAttribute("loginMap");
			loginMap.remove(Integer.toString(user.getUid()));
			application.setAttribute("loginMap", loginMap);
			session.removeAttribute("user");
		}


	}

}
