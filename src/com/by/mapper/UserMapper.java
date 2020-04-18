package com.by.mapper;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.by.entity.PageInfo;
import com.by.entity.Postings;
import com.by.entity.Reviews;
import com.by.entity.User;
@Repository 
public interface UserMapper {
	int userRegister(User user);
	User getUserByName(String uname);
	User getUserByEmail(String uemail);
	List<User> userLogin(Map<String,Object> map);
	int insertPosting(Map<String,Object> map);
	int insertReview(Map<String,Object> map);
	List<Postings> getPostings(int userid);
	List<Reviews> getReviews(int userid);
	Reviews getReviewsAndUser(int reviewid);
	String getUserName(int uid);
	List<Reviews> getAllMessage();
	List<Postings> getAllPostings();
	List<Reviews> getReviewsByPostingId(int postingId);
	String getUserNameByPostingId(int postingId);
	int getAllCountsOfReview();
	List<Postings> getSomePostings(PageInfo pageinfo);
}
