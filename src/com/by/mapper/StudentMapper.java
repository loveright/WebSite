package com.by.mapper;

import com.by.entity.Student;

public interface StudentMapper {
	void addStudent(Student student);
	Student queryStudentByStuno(int stuNo);
}
