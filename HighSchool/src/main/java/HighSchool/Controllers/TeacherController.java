package HighSchool.Controllers;

import HighSchool.Interfaces.TeacherDao;
import HighSchool.Pojos.Teacher;
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
public class TeacherController {
    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
   
    @Resource
    TeacherDao teacherDao;
    
    
  
    
    /**
     * Return all Teachers stored in the data base
     * @return
     */
    @RequestMapping("/teachers")
    public List getAllTeachers(){
        return teacherDao.getAllTeachers();
    }
    
    /**
     *Create a new Teacher and save the given information in the data base
     *  
     * @param firstName firstname of the new Teacher
     * @param lastName last name of the new Teacher
     * @return firstName and LastNam of the new Teacher
     */
    @RequestMapping("/teacher")
    public String newTeacher(@RequestParam(value = "firstName") String firstName,
            @RequestParam(value = "lastName") String lastName) {
            Teacher teacher = new Teacher(firstName,lastName);
            return teacherDao.newTeacher(teacher);
    }
    
    /**
     *Search for a Teacher by id number
     * @param idTeacher Teacher's id number
     * @return return String of firstName lastName and Birthday
     */
    @RequestMapping("/teacher/by")
    public Teacher getTeacher(@RequestParam(value = "idTeacher")int idTeacher) {
        return teacherDao.getTeacher(idTeacher);
    }
    
    
    
    /**
     *Update the birthday of a given Teacher
     * @param idTeacher Teacher's registration number
     * @param dateString new date for  birthday
     * @return the first name, last name and new birthday
     */
    @RequestMapping("/teacher/dateofbirth")
    public String DateOfBirth(@RequestParam(value = "idTeacher") int idTeacher,
            @RequestParam(value = "date") String dateString) {
        
        
        Date date = new Date();
        
        try {
            date = formatter.parse(dateString);
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return teacherDao.setTeacherDateOfBirth(idTeacher, date);
    }
    
    
    @RequestMapping("/teacher/course")
    public String addTeacherToCourse(@RequestParam(value="idCourse")int idCourse,
                                     @RequestParam(value="idTeacher")int idTeahcer){
        
        return teacherDao.addTeacherToCourse(idTeahcer, idCourse);
    }

}
