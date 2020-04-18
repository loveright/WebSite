package com.by.socket;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.HandshakeInterceptor;

import com.by.entity.User;

public class WebSocketHandshakeInterceptor implements HandshakeInterceptor{

	@Override
	public void afterHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler webSocketHandler, Exception exception) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler webSocketHandler,
			Map<String, Object> attributes) throws Exception {
		// TODO Auto-generated method stub
		 if (request instanceof ServletServerHttpRequest){
	           ServletServerHttpRequest servletServerHttpRequest = (ServletServerHttpRequest) request;
	           HttpSession session = servletServerHttpRequest.getServletRequest().getSession(false);
	           if(session != null){
	               //从session中获取当前用户
	               User user = (User) session.getAttribute("user");
	               attributes.put("user",user);
	           }
	       }
	       return true;	
	}

}
