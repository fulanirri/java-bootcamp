package HighSchool.Interfaces;

import HighSchool.HibernateUtil;
import HighSchool.Pojos.Course;
import HighSchool.Pojos.Teacher;

import HighSchool.Pojos.TeacherHasCourse;
import java.util.Date;
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
public class TeacherDaoImp implements TeacherDao {

    @Override
    public List<Teacher> getAllTeachers() {
        SessionFactory sf = HibernateUtil.getSessionFactory();
        Session session = sf.openSession();
        List<Teacher> listOfTeacher = session.createQuery("FROM Teacher v").list();

        return listOfTeacher;
    }

    @Override
    public String newTeacher(Teacher teacher) {
        SessionFactory sf = null;
        Session session = null;
        Transaction tx = null;
        try {
            sf = HibernateUtil.getSessionFactory();
            session = sf.openSession();
            tx = session.beginTransaction();
            session.save(teacher);
            tx.commit();
            session.close();
        } catch (Exception e) {
            tx.rollback();
            System.out.println("Not Added" + e.toString());
        }

        return teacher.getFirstName() + ","
                + teacher.getLastName() + " Added";
    }

    @Override
    public Teacher getTeacher(int idTeacher) {

        SessionFactory sf = HibernateUtil.getSessionFactory();
        Session session = sf.openSession();
        String hql = "FROM Teacher a WHERE a.idTeacher =" + idTeacher;
        Query query = session.createQuery(hql);
        Teacher teacher = (Teacher) query.uniqueResult();
        session.close();

        return teacher;
    }

    @Override
    public String setTeacherDateOfBirth(int idTeacher, Date dateOfBirth) {
        SessionFactory sf = HibernateUtil.getSessionFactory();
        Session session = sf.openSession();
        Teacher teacher = (Teacher) session.get(Teacher.class, idTeacher);
        if (teacher != null) {
            Transaction tx = session.beginTransaction();
            teacher.setDateOfBirth(dateOfBirth);
            session.update(teacher);
            tx.commit();
            session.close();
        } else {
            return "Teacher doesn't exist";
        }
        return teacher.getFirstName() + ","
                + teacher.getLastName() + " Date of Birth"
                + teacher.getDateOfBirth();
    }

    @Override
    public String addTeacherToCourse(int idTeacher, int idCourse) {
        SessionFactory sf = null;
        Session session = null;
        Transaction tx = null;
        try {
            sf = HibernateUtil.getSessionFactory();
            session = sf.openSession();
            tx = session.beginTransaction();

            Teacher teacher = (Teacher) session.get(Teacher.class, idTeacher);
            Course course = (Course) session.get(Course.class, idCourse);

            TeacherHasCourse teacherHasCourse;
            teacherHasCourse = new TeacherHasCourse(course, teacher);

            session.persist(teacherHasCourse);

            tx.commit();
            session.close();

            return "Teacher" + teacher.getLastName() + "," + teacher.getFirstName()
                    + "Added to Course " + course.getCourse();

        } catch (Exception e) {
            return e.toString();
        }

        
    }

}
