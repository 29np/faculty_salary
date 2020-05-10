package service.impl;


import bean.Faculty;
import service.FacultyService;

import java.util.List;

public class FacultyServiceImpl implements FacultyService {

	@Override
	public Faculty login(String username) {
		
		return facultyDao.login(username);
		
	}
}
