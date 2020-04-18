package com.by.socket;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

@Configuration
@EnableWebMvc
@EnableWebSocket
public class WebSocketConfig extends WebMvcConfigurerAdapter implements WebSocketConfigurer{

//	@Autowired
//	private MsgScoketHandler msgSocketHandler;
	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		// TODO Auto-generated method stub
		//注册websocket server实现类，"/webSocketServer"访问websocket的地址
		registry.addHandler(msgSocketHandler(),
                "/webSocketServer").
                addInterceptors(new WebSocketHandshakeInterceptor());
		//使用socketjs的注册方法
        registry.addHandler(msgSocketHandler(),
                "/sockjs/webSocketServer").
                addInterceptors(new WebSocketHandshakeInterceptor())
                .withSockJS();

	}
	@Bean
    public WebSocketHandler msgSocketHandler() {
        return new MsgScoketHandler();
    }

}
