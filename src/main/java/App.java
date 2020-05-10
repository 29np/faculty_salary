import bean.Faculty;
import bean.Salary;
import dao.FacultyDao;
import dao.SalaryDao;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import java.util.List;

public class App
{
    public static void main(String[] args)
    {
        /*Alien obj = null;

        Configuration con = new Configuration().configure().addAnnotatedClass(Alien.class);
        SessionFactory sf = con.buildSessionFactory();
        Session session = sf.openSession();
        Transaction tx = session.beginTransaction();
        obj = (Alien)session.get(Alien.class, 102);
        tx.commit();
        System.out.println(obj);*/

        Faculty obj = null;
        Configuration con = new Configuration().configure().addAnnotatedClass(Faculty.class);
        SessionFactory sf = con.buildSessionFactory();
        Session session = sf.openSession();
        Transaction tx = session.beginTransaction();

        FacultyDao temp = new FacultyDao();
        String password = "1234";
        obj = (Faculty) temp.login("ethan.gems@cadbury.com");
        String t = obj.getPassword();
        if(t.equals(password))System.out.println("User Verified\n");
        else System.out.println("User not Verified\n");
        //Faculty obj1 = (Faculty) session.get(Faculty.class, "rory@iiitb.org");
        SalaryDao temp2 = new SalaryDao();
        //List<Salary> obj1 = temp2.getparticulardetails(obj.getId(),01,2019);
        List<Salary> obj1 = temp2.getalldetails(obj.getId());
        //Salary obj1 = (Salary)session.get(Salary.class,"ad468avsdsad5351");
        tx.commit();
        System.out.println(obj);
        for(int i=0;i<obj1.size();i++)System.out.println(obj1.get(i));

    }
}
