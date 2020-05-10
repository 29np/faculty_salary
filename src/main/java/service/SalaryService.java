package service;
import bean.Salary;
import dao.SalaryDao;

import java.util.List;


public interface SalaryService {
    
    dao.SalaryDao salaryDao = new SalaryDao();
    
    List<bean.Salary> getalldetails(String id);
    Salary getparticulardetails(String id, int monthno, int year);
}
