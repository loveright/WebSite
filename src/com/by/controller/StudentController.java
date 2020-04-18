package com.by.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.by.entity.Student;
import com.by.service.StudentService;

@RequestMapping("controller")
@Controller//作用相当于bean将该类注入到IOC容器
public class StudentController {
	@Autowired
	@Qualifier("studentService")
	private StudentService studentService;
	
	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}

	@RequestMapping(value = "queryStudentByNo/{stuno}",method = RequestMethod.GET)
	public String queryStudentByNo(@PathVariable("stuno") int stuNo,Map<String,Student> map)
	{
		System.out.println("你好");
		Student student = studentService.queryStudentByNo(stuNo);
		map.put("student", student);
		return "result";
		
	}
}

