package HighSchool.Interfaces;

import HighSchool.HibernateUtil;
import HighSchool.Pojos.Course;
import HighSchool.Pojos.Teacher;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.stereotype.Component;

/**
 *
 * @author german
 */
@Component
public class CourseDaoImp implements CourseDao {

    @Override
    public List<Course> getAllCourses() {
        SessionFactory sf = HibernateUtil.getSessionFactory();
        Session session = sf.openSession();
        Query query = session.createQuery("select v from Course v");
        List<Course> listOfCourse = query.list();
        session.close();
        return listOfCourse;
    }

    @Override
    public String newCourse(Course course) {

        SessionFactory sf = null;
        Session session = null;
        Transaction tx = null;
        try {
            sf = HibernateUtil.getSessionFactory();
            session = sf.openSession();
            tx = session.beginTransaction();
            session.save(course);
            tx.commit();
            session.close();
        } catch (Exception e) {
            tx.rollback();
            System.out.println("Not Added" + e.toString());
        }
        return course.getCourse() + " Added";
    }

    @Override
    public Course getCourse(int idCourse) {
        SessionFactory sf = HibernateUtil.getSessionFactory();
        Session session = sf.openSession();
        String hql = "FROM Course a WHERE a.idCourse =" + idCourse;
        Query query = session.createQuery(hql);
        Course course = (Course) query.uniqueResult();
        session.close();

        return course;
    }

    @Override
    public String addTeacherToCourse(int idTeacher, int idCourse) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

   
    

}
