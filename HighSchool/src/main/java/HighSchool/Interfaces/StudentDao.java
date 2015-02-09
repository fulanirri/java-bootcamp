package HighSchool.Interfaces;


import java.util.Date;
import java.util.List;
import org.springframework.stereotype.Service;
import HighSchool.Pojos.Student;

/**
 *
 * @author german
 */
@Service
public interface StudentDao {
    
    
    public List<Student> getAllStudents();
    public String newStudent(Student student);
    public Student getStudent(int regNum);
    public String setStudentDateOfBirth(int regNum,Date dateOfBirth);

}
