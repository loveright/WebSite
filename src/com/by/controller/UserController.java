package com.by.controller;


import java.io.IOException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.exceptions.TooManyResultsException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;
import org.springframework.web.socket.TextMessage;

import com.by.entity.PageInfo;
import com.by.entity.Postings;
import com.by.entity.Reviews;
import com.by.entity.User;
import com.by.entity.UserData;
import com.by.service.UserService;
import com.by.socket.MsgScoketHandler;
//import com.by.socket.MsgScoketHandler.OnAUpdateListener;
import com.by.thread.MyThread;
import com.by.vo.ReviewAndPosting;



@Controller
@RequestMapping(value = "/controller")
public class UserController{
//	@Bean//这个注解会从Spring容器拿出Bean
//    public MsgScoketHandler msgSocketHandler() {
// 
//        return new MsgScoketHandler();
//    }
	@Autowired
	@Qualifier("userService")
	private UserService userService;
	MyThread thread1=new MyThread();
    Thread thread;  	    
    MsgScoketHandler msgSocketHandler;
    private boolean flag = true;//一个用户开启线程开启后，其他不再重复开启
	//新用户注册
	@ResponseBody
	@RequestMapping(value="/register",method = RequestMethod.POST)
	public void userRegister(@RequestBody UserData userdata,
			HttpServletResponse response){					
		response.setContentType("text/html; charset=UTF-8");				
		try {		
			User userWithName = userService.getUserByName(userdata.getUsername());
			if(userWithName != null){
				response.getWriter().print("用户姓名已被注册");
				return;
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}									
		try {		
			User userWithEmail = userService.getUserByEmail(userdata.getUseremail());	
			if(userWithEmail != null){	
				response.getWriter().print("邮箱已被注册！");
				return;
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch(RuntimeException e ){
			System.out.println("进入异常");
			try {
				response.getWriter().print("邮箱已被注册！");
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			throw new RuntimeException("具体异常TooManyResultsException");
		}					
		User user = new User();
		user.setUname(userdata.getUsername());
		user.setUpassword(userdata.getUserpassword());
		user.setUemail(userdata.getUseremail());
		Date date= new Date();
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String rtime = format.format(date);
		user.setRtime(rtime);		
		user.setUroot(userdata.getUroot());
		try {
			int n = userService.userRegister(user);
			if(n > 0)
			{
				response.getWriter().print("注册成功，请登录");	
				return;
			}		
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
	}
	
	//用户登录
	@RequestMapping(value="/login",method = RequestMethod.POST)
	public void userLogin(@RequestBody UserData userdata,HttpServletRequest request,
			HttpServletResponse response){	
		try{
			response.setContentType("text/html; charset=UTF-8");
			Map<String,Object> map = new HashMap<>();
			map.put("uname", userdata.getUsername());
			map.put("upassword", userdata.getUserpassword());
			List<User> listOfUser = userService.userLogin(map);
			if(listOfUser.size() > 0){
				HttpSession session = request.getSession();
				ServletContext application = session.getServletContext();
				Map<String, Object> loginMap = (Map<String, Object>) application.getAttribute("loginMap");
				if (loginMap == null) {
				    loginMap = new HashMap<String, Object>();
				}			
					
				User user = (User) listOfUser.get(0);
				for (String key : loginMap.keySet()) {
					//根据用户id判断是否登录
				    if (Integer.toString(user.getUid()).equals(key)) {
				    	//如果用户存在根据用户id得到map中的session的id,得出是否是同一浏览器
					    if (session.getId().equals(loginMap.get(key))) {
					        response.getWriter().print("在同一地点重复登录");
					        return;
					    } else {
					    	response.getWriter().print("异地已登录，请先退出登录");
					    	return;
					    }
				    }
				}
				loginMap.put(Integer.toString(user.getUid()),session.getId());
				application.setAttribute("loginMap", loginMap);
				String username1 = user.getUname().substring(0, 6);
				StringBuffer username2 = new StringBuffer(username1);
				username2.append("...");
				String unameHtml = username2.toString();			
				session.setAttribute("unameHtml", unameHtml);
				session.setAttribute("user", user);	
				session.setMaxInactiveInterval(10*60);
				thread1.setUserService(userService);					
				if(flag){
					thread1.startMe();
					thread = new Thread(thread1);
					thread.start();
					flag = false;
				}
				System.out.println("当前用户数量："+MsgScoketHandler.nums);
				response.getWriter().print(unameHtml);
				return;
			}else{				
				response.getWriter().print("用户名或密码错误");
				return;				
			}	
		}catch (IOException e) {			
			e.printStackTrace();
		}							
	}
	//用户退出
	@RequestMapping(value="/out",method = RequestMethod.POST)
	public void userOut(HttpServletRequest request, HttpServletResponse response){
		response.setContentType("text/html; charset=UTF-8");	
		try{
			HttpSession session = request.getSession();		
			User user = (User) session.getAttribute("user");
			if(user == null)
			{
				response.getWriter().print("退出成功");
			}else{
				String uid = Integer.toString(user.getUid());
				session.removeAttribute("user");
				session.removeAttribute("unameHtml");
				session.invalidate();
				ServletContext application = session.getServletContext();
				@SuppressWarnings("unchecked")
				Map<String, Object> loginMap = (Map<String, Object>) application.getAttribute("loginMap");
				loginMap.remove(uid);
				application.setAttribute("loginMap", loginMap);
				Enumeration em = request.getSession().getAttributeNames();
				while(em.hasMoreElements()){
					request.getSession().removeAttribute(em.nextElement().toString());
				}							
				System.out.println("用户剩余数量："+MsgScoketHandler.users.size());
				if(MsgScoketHandler.users.size() <= 1){
					flag = true;
					thread1.stopMe();
				}	
				response.getWriter().print("退出成功");
			}			
		}catch (IOException e) {			
			e.printStackTrace();
		}						
	}
	//发布评论前判断游客还是用户
	@ResponseBody
	@RequestMapping(value="/publish",method = RequestMethod.POST)
	public ModelAndView publishReview(HttpServletRequest request, HttpServletResponse response){
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		User user =  (User) session.getAttribute("user");
		String unameHtml = (String) session.getAttribute("unameHtml");
		Map<String, Object> map = new HashMap<>();  
		if(user != null && unameHtml.length() > 0)
		{	
			map.remove("uroot", 3);
			map.put("user", user);			
			return new ModelAndView(new MappingJackson2JsonView(),map);
		}else{
			int uroot = 3;//游客权限为3
			map.put("uroot", uroot);			
			return new ModelAndView(new MappingJackson2JsonView(),map);
		}		
	}
	//向数据库插入首条评论
	@Transactional
	@ResponseBody
	@RequestMapping(value="/insertreview",method = RequestMethod.POST)
	public Reviews insertReview(@RequestBody UserData userdata,HttpSession session){
		Reviews review = null;
		try{			
			Map<String,Object> map = new HashMap<>();
			map.put("userid", userdata.getUid());
			int pcount = userService.insertPosting(map);			
			if(pcount > 0){							
				map.put("lastid",0);
				map.put("postingid",map.get("postingId"));
				map.put("userid", userdata.getUid());
				map.put("context", userdata.getReviewText());			
				SimpleDateFormat simp = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");					
				String date = simp.format(new Date());
				map.put("reviewtime",Timestamp.valueOf(date));					
				int rcount = userService.insertReview(map);
				
				if(rcount > 0){			
					thread1.setUser((User)session.getAttribute("user"));
					review  = userService.getReviewsAndUser(Integer.parseInt( map.get("reviewId").toString()));
					System.out.println(review);
					if(review != null)
					{
						return review;
					}
				}
			}			
		}catch(Exception e){			
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			e.printStackTrace();
		}		
		return review;
	}
	@Transactional
	@ResponseBody
	@RequestMapping(value="/review",method = RequestMethod.POST)
	public Reviews getAllMessage(@RequestBody UserData userdata,HttpServletRequest request,
			HttpServletResponse response,HttpSession session){
		System.out.println(userdata.getPostingId()+";"+userdata.getLastId()+";"+userdata.getUid()
		+";"+userdata.getReviewText());
		Reviews review = null;
		try{			
			Map<String,Object> map = new HashMap<>();
			map.put("lastid",userdata.getLastId());
			map.put("postingid",userdata.getPostingId());
			map.put("userid", userdata.getUid());
			map.put("context", userdata.getReviewText());			
			SimpleDateFormat simp = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");					
			String date = simp.format(new Date());
			map.put("reviewtime",Timestamp.valueOf(date));					
			int rcount = userService.insertReview(map);
			if(rcount > 0){				
				thread1.setUser((User)session.getAttribute("user"));
				review  = userService.getReviewsAndUser(Integer.parseInt( map.get("reviewId").toString()));
				System.out.println(review);
				if(review != null)
				{
					return review;
				}
			}
		}catch(Exception e){			
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			e.printStackTrace();
		}				
		return review;
	}
	@RequestMapping(value="/getUserName",produces="text/html;charset=UTF-8;",method = RequestMethod.POST)
	@ResponseBody//produces="text/html;charset=UTF-8;"解决中文返回到前端乱码问题，用map<String,Object>方式不会乱
	public String getUserName(@RequestParam(value = "userId") int userId){	
		Map<String,Object> map = new HashMap<>();
		String uname = userService.getUserName(userId);	
		//map.put("uname", uname);
		//return map;
		return uname;
	}
	@ResponseBody
	@RequestMapping(value="/refresh",method = RequestMethod.POST)
	public Map<String,Object> getAllMessage(@RequestBody PageInfo pageInfo,HttpSession session){
//		HttpSession session = request.getSession();
		User user =  (User) session.getAttribute("user");
		String unameHtml = (String) session.getAttribute("unameHtml");
		Map<String,Object> map = new HashMap<>();
		List<Postings> listOfPosting = null;
		if(user != null && unameHtml.length() > 0)
		{						
			map.put("uroot", user.getUroot());
		}
		if(pageInfo.getPage().equals("lastPage"))
		{
			listOfPosting = userService.getAllPostings();			
			int pageNum = listOfPosting.size() % pageInfo.getPageSize() == 0 ? (listOfPosting.size() / pageInfo.getPageSize()-1)*pageInfo.getPageSize():listOfPosting.size() / pageInfo.getPageSize() * pageInfo.getPageSize();
			pageInfo.setPageNum(pageNum);
			map.put("pageNum", pageNum);
			map.put("lastPage", "lastPage");
			listOfPosting = userService.getSomePostings(pageInfo);
		}else if(pageInfo.getPage().equals("firstPage")){
			listOfPosting = userService.getAllPostings();			
			int pageNum = listOfPosting.size() % pageInfo.getPageSize() == 0 ? (listOfPosting.size() / pageInfo.getPageSize()-1)*pageInfo.getPageSize():listOfPosting.size() / pageInfo.getPageSize() * pageInfo.getPageSize();
			map.put("pageNum", pageNum);
			listOfPosting = userService.getSomePostings(pageInfo);
		}else{
			listOfPosting = userService.getSomePostings(pageInfo);
		}
		//List<Postings> listOfPosting = userService.getAllPostings();
		
		System.out.println(listOfPosting.size());
		map.put("postings",listOfPosting);	
		thread1.setUserService(userService);	
//		flag = true;
//		thread1.stopMe();
//		if(flag){
//			thread1.startMe();
//			thread = new Thread(thread1);
//			thread.start();
//			flag = false;
//		}
		return map;
	}
	@ResponseBody
	@RequestMapping(value="/foreachmessage",method = RequestMethod.POST)
	public Map<String,Object> getForeachMessage(@RequestParam(value = "postingId") int postingId){
		Map<String,Object> map = new HashMap<>();
		List<Reviews> listOfReviews = userService.getReviewsByPostingId(postingId);
		List<ReviewAndPosting> rapOfList = new LinkedList<ReviewAndPosting>();
		String firstName = userService.getUserNameByPostingId(postingId);
		String otherName = null;
		ReviewAndPosting rap = null;
		for(int i = 0;i < listOfReviews.size();i++)
		{	
			rap = new ReviewAndPosting();
			if(listOfReviews.get(i).getLastId() == 0)
			{
				int lastid = listOfReviews.get(i).getReviewId();
				otherName = userService.getReviewsAndUser(lastid).getUser().getUname();
			}else{
				otherName = userService.getReviewsAndUser(listOfReviews.get(i).getLastId()).getUser().getUname();
			}			
			rap.setReviewId(listOfReviews.get(i).getReviewId());
			rap.setLastId(listOfReviews.get(i).getLastId());
			rap.setPostingId(listOfReviews.get(i).getPostingId());
			rap.setUserId(listOfReviews.get(i).getUserId());
			rap.setFirstName(firstName);
			rap.setCurName(listOfReviews.get(i).getUser().getUname());
			rap.setOtherName(otherName);
			rap.setContent(listOfReviews.get(i).getContext());
			rap.setDateTime(listOfReviews.get(i).getReviewTime());
			rapOfList.add(rap);
		}
		map.put("allreviews",rapOfList);
		return map;
	}

	
}
