package HighSchool.Controllers;

import HighSchool.Interfaces.StudentDao;
import HighSchool.Pojos.Student;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;


/**
 *
 * @author german
 */
@RestController
public class StudentController {
    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
   
    @Resource
    StudentDao studentDao;
    
    
  
    
    /**
     * Return all Sutdent stored in the data base
     * @return
     */
    @RequestMapping("/students")
    public List getAllStudents(){
       return studentDao.getAllStudents();
    }
    
    /**
     *Create a new Student and save the given information in the data base
     *  
     * @param firstName firstname of the new Student
     * @param lastName last name of the new Student
     * @return firstName and LastNam of the new Student
     */
    @RequestMapping("/student")
    public String newStudent(@RequestParam(value = "firstName") String firstName,
            @RequestParam(value = "lastName") String lastName) {
        
//        Student student = new Student(firstName, lastName);
//        return studentDao.newStudent(student);
        
        return "hola";
    }
    
    /**
     *Search for a Student by registration number
     * @param regNum Student's registration number
     * @return return String of firstName lastName and Birthday
     */
    @RequestMapping("/student/by/")
    public Student getStudent(@RequestParam(value = "regNum")int regNum) {
        return studentDao.getStudent(regNum);
    }
    
    
    
    /**
     *Update the birthday of a given Student
     * @param regNum Student's registration number
     * @param dateString new date for  birthday
     * @return the first name, last name and new birthday
     */
    @RequestMapping("/student/dateofbirth")
    public String DateOfBirth(@RequestParam(value = "regNum") int regNum,
            @RequestParam(value = "date") String dateString) {
        
        
        Date date = new Date();
        try {
            date = formatter.parse(dateString);
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return studentDao.setStudentDateOfBirth(regNum, date);
    }
    
    
    

}
