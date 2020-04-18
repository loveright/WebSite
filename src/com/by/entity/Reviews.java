package com.by.entity;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFilter;
import com.fasterxml.jackson.annotation.JsonFormat;

public class Reviews {
	private int reviewId;
	private int lastId;
	private int postingId;
	private int userId;
	private String context;
//	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")//页面写入数据库时格式化
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone="GMT+8")//数据库导出页面时json格式化
	private Date reviewTime;
	private User user;
	public Reviews() {		
	}
	
	public int getReviewId() {
		return reviewId;
	}
	
	public void setReviewId(int reviewId) {
		this.reviewId = reviewId;
	}
	public int getLastId() {
		return lastId;
	}
	public void setLastId(int lastId) {
		this.lastId = lastId;
	}
	public int getPostingId() {
		return postingId;
	}
	public void setPostingId(int postingId) {
		this.postingId = postingId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getContext() {
		return context;
	}
	public void setContext(String context) {
		this.context = context;
	}
	public Date getReviewTime() {
		return reviewTime;
	}
	public void setReviewTime(Date reviewTime) {
		this.reviewTime = reviewTime;
	}
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Override
	public String toString() {
		return "Reviews [reviewId=" + reviewId + ", lastId=" + lastId + ", postingId=" + postingId + ", userId="
				+ userId + ", context=" + context + ", reviewTime=" + reviewTime + ", user=" + user + "]";
	}

	
	
}
