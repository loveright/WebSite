package com.by.service.impl;

import com.by.entity.Student;
import com.by.mapper.StudentMapper;
import com.by.service.StudentService;

public class StudentServiceImpl implements StudentService{
	//service依赖于dao(mapper)
	private StudentMapper studentMapper;
	
	public void setStudentMapper(StudentMapper studentMapper) {
		this.studentMapper = studentMapper;
	}

	@Override
	public Student queryStudentByNo(int stuNo) {
		return studentMapper.queryStudentByStuno(stuNo);		
	}
	
}
