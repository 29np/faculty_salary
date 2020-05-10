package dao;


import java.util.List;

import javax.persistence.Query;

import bean.Faculty;
import util.SessionUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;


public class FacultyDao {
   
	public Faculty login(String username) {

		Session session = SessionUtil.getSession();
		Transaction transaction = session.beginTransaction();
		
		String hql = "From Faculty f where f.username =:givenId";
		Query query = session.createQuery(hql);
		query.setParameter("givenId", username);
		Faculty emp = (Faculty) query.getSingleResult();
		
		transaction.commit();
		session.close();
		return emp;
	}

}