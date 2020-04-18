package com.by.socket;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;

import com.by.entity.User;
import com.by.mapper.UserMapper;
import com.by.service.UserService;
import com.by.service.impl.UserServiceImpl;
import com.by.thread.MyThread;

//@Component
public class MsgScoketHandler implements WebSocketHandler{
	
	/**已经连接的用户*/
    public static final ArrayList<WebSocketSession> users;
    public static int nums;	
//    private OnAUpdateListener onAUpdateListener;
//    public interface OnAUpdateListener{
//        void updateListener(int nums);
//    }
//    public void setOnAUpdateListener(OnAUpdateListener onAUpdateListener){
//        this.onAUpdateListener = onAUpdateListener;
//    }
//    public void setNums(int nums){
//        this.nums = nums;
//        onAUpdateListener.updateListener(nums);
//    }
    static {
        //保存当前连接用户
        users = new ArrayList<WebSocketSession>();
    }
   
	@Override
	public void afterConnectionClosed(WebSocketSession webSocketSession, CloseStatus closeStatus) throws Exception {
		// TODO Auto-generated method stub
		//thread1.stopMe();
		User user  = (User) webSocketSession.getAttributes().get("user");
		System.out.println(user.getUname()+":连接关闭" + closeStatus);
		users.remove(webSocketSession);
	}

	//建立链接
	@Override
	public void afterConnectionEstablished(WebSocketSession webSocketSession) throws Exception {
		// TODO Auto-generated method stub
		users.add(webSocketSession);	
		nums = users.size();
//		if(this != null)
//		{
//			this.setNums(users.size());
//		}else{
//			System.out.println("为空");
//		}		
		User user  = (User) webSocketSession.getAttributes().get("user");
		if(user != null){
            System.out.println("当前连接用户======"+user.getUname());                		          
            //this.sendMessageToUsers(new TextMessage("我们已经成功建立socket通信了"));            
        }		
		//thread.start();
	}

	//接收消息
	@Override
	public void handleMessage(WebSocketSession webSocketSession, WebSocketMessage<?> webSocketMessage) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void handleTransportError(WebSocketSession webSocketSession, Throwable throwable) throws Exception {
		// TODO Auto-generated method stub
		if (webSocketSession.isOpen()){
            //关闭session
            try {
                webSocketSession.close();
            } catch (IOException e) {
            }
        }
		System.out.println("连接出错");
		//thread1.stopMe();
        //移除用户
        users.remove(webSocketSession);
	}

	@Override
	public boolean supportsPartialMessages() {
		// TODO Auto-generated method stub
		return false;
	}
	//给所有用户发送消息
	public void sendMessageToUsers(TextMessage message) {
		System.out.println("用户数量："+users.size());
        for (WebSocketSession user : users) {
        	
            try {
                if (user.isOpen()) {
                	if(user != (User) user.getAttributes().get("user"))
                		user.sendMessage(message);
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
	 }
	//给除了自己以外的其他人发消息
	public void sendMessageToUser(User userself, TextMessage message) {
        for (WebSocketSession user : users) {
            if (user.getAttributes().get("user") != userself) {
                try {
                    if (user.isOpen()) {
                        user.sendMessage(message);
                    }
                } catch (IOException e) {
                    e.printStackTrace();
                }
                break;
            }
        }
    }
}
