package service.impl;

import bean.Salary;
import service.SalaryService;

import java.util.List;

public class SalaryServiceImpl implements SalaryService {

	@Override
	public List<Salary> getalldetails(String id) {

		return salaryDao.getalldetails(id);
		
	}

	@Override
	public Salary getparticulardetails(String id, int monthno, int year) {
		
		return salaryDao.getparticulardetails(id, monthno, year);
		
	}
    
    
}
