package HighSchool.Interfaces;

import HighSchool.HibernateUtil;
import java.util.Date;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.stereotype.Component;
import HighSchool.Pojos.Student;

/**
 *
 * @author german
 */

@Component
public class StudentDaoImp implements StudentDao{
    
    

    @Override
    public List<Student> getAllStudents() {
        
        SessionFactory sf = HibernateUtil.getSessionFactory();
        Session session = sf.openSession();
        
       
        List<Student> listOfStudent =  session.createQuery("FROM Student v").list();
        
        session.close();
    
        
        return listOfStudent;   
    }

    @Override
    public String newStudent(Student student) {
        SessionFactory sf = null;
        Session session= null;
        Transaction tx = null;
        try{
            sf = HibernateUtil.getSessionFactory();
            session = sf.openSession();
            tx = session.beginTransaction();
            session.save(student);
            tx.commit();
            session.close();
        }catch (Exception e){
            tx.rollback();
            System.out.println("Not Added"+e.toString());
        }
        
        return student.getFirstName()+","+
                student.getLastName()+" Added";
    }

    @Override
    public String setStudentDateOfBirth(int regNum,Date dateOfBirth) {
     
        SessionFactory sf = HibernateUtil.getSessionFactory();
        Session session = sf.openSession();
        Student student = (Student)session.get(Student.class, regNum);
        if(student!=null){
            Transaction tx = session.beginTransaction();
            student.setDateOfBirth(dateOfBirth);
            session.update(student);
            tx.commit();
            session.close();
       } else{
            return "Student doesn't exist";
        } 
       return student.getFirstName()+","+
                student.getLastName()+" Date of Birth"+
                student.getDateOfBirth();
    }
    
    @Override
    public Student getStudent(int regNum){
        
        SessionFactory sf = HibernateUtil.getSessionFactory();
        Session session = sf.openSession();
        String hql = "FROM Student a WHERE a.regNum ="+regNum;
        Query query = session.createQuery(hql);
        Student student =(Student) query.uniqueResult();
        session.close();
        
        return student; 
        
        
    }
    
    

}
