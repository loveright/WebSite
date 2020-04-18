package com.by.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.by.entity.PageInfo;
import com.by.entity.Postings;
import com.by.entity.Reviews;
import com.by.entity.User;
import com.by.mapper.UserMapper;
import com.by.service.UserService;
//@Service
public class UserServiceImpl implements UserService{
	
//	@Autowired
//	@Qualifier("userMapper")
//	private UserMapper userMapper;
	private UserMapper userMapper;
	
	public void setUserMapper(UserMapper userMapper) {
		this.userMapper = userMapper;
	}

	@Override
	public int userRegister(User user) {
		return userMapper.userRegister(user);		
	}

	@Override
	public User getUserByName(String uname) {
		// TODO Auto-generated method stub
		User user = userMapper.getUserByName(uname);
		return user;
	}

	@Override
	public User getUserByEmail(String uemail) {
		// TODO Auto-generated method stub
		User user = userMapper.getUserByEmail(uemail);
		return user;
	}

	@Override
	public List<User> userLogin(Map<String, Object> map) {
		// TODO Auto-generated method stub
		List<User> listOfUser = userMapper.userLogin(map);
		return listOfUser;
	}

	@Override
	public int insertPosting(Map<String, Object> map) {				
		return userMapper.insertPosting(map);
	}

	@Override
	public int insertReview(Map<String, Object> map) {			
		return userMapper.insertReview(map);
	}

	@Override
	public List<Postings> getPostings(int userid) {
		// TODO Auto-generated method stub
		List<Postings> listOfPostings = userMapper.getPostings(userid);
		return listOfPostings;
	}

	@Override
	public List<Reviews> getReviews(int userid) {		
		List<Reviews> listOfReviews = userMapper.getReviews(userid);
		return listOfReviews;
	}

	@Override
	public Reviews getReviewsAndUser(int reviewid) {		
		return userMapper.getReviewsAndUser(reviewid);
	}

	@Override
	public String getUserName(int uid) {			
		return userMapper.getUserName(uid);
	}

	@Override
	public List<Reviews> getAllMessage() {
			
		return userMapper.getAllMessage();
	}

	@Override
	public List<Postings> getAllPostings() {
		
		return userMapper.getAllPostings();
	}

	@Override
	public List<Reviews> getReviewsByPostingId(int postingId) {
		// TODO Auto-generated method stub
		
		return userMapper.getReviewsByPostingId(postingId);
	}

	@Override
	public String getUserNameByPostingId(int postingId) {
		// TODO Auto-generated method stub
		return userMapper.getUserNameByPostingId(postingId);
	}

	@Override
	public int getAllCountsOfReview() {
		// TODO Auto-generated method stub
		return userMapper.getAllCountsOfReview();
	}

	@Override
	public List<Postings> getSomePostings(PageInfo pageinfo) {
		// TODO Auto-generated method stub
		return userMapper.getSomePostings(pageinfo);
	}
	
}
