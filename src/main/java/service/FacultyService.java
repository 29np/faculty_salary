package service;

import bean.Faculty;
import dao.FacultyDao;

public interface FacultyService {
    
    FacultyDao facultyDao = new FacultyDao();
    
    Faculty login(String username);
    
}
