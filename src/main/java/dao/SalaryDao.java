package dao;

import java.util.List;

import javax.persistence.Query;

import bean.Salary;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.SessionUtil;

public class SalaryDao {
	
	
	public List<bean.Salary> getalldetails(String id) {
		
		Session session = util.SessionUtil.getSession();
		Transaction transaction = session.beginTransaction();
		
		String hql = "From Salary s where s.id=:givenId";
		Query query = session.createQuery(hql);
		query.setParameter("givenId", id);
		
		List<bean.Salary> s = query.getResultList();
		
		transaction.commit();
		session.close();
		return s;
	}
	public Salary getparticulardetails(String id, int monthno, int year) {
			
			Session session = SessionUtil.getSession();
			Transaction transaction = session.beginTransaction();
			
			String hql = "From Salary s where s.id =:givenId1 and s.year =:givenId3 and s.monthno =:givenId2";
			Query query = session.createQuery(hql);
			query.setParameter("givenId1", id);
			query.setParameter("givenId2", monthno);
			query.setParameter("givenId3", year);
			
			Salary s = (Salary) query.getSingleResult();
			transaction.commit();
			session.close();
			return s;
		}
    
}
