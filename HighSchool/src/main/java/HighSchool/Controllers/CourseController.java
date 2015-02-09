package HighSchool.Controllers;

import HighSchool.Interfaces.CourseDao;
import HighSchool.Interfaces.TeacherDao;
import HighSchool.Pojos.Course;
import HighSchool.Pojos.Teacher;
import javax.annotation.Resource;
import java.util.List;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author german
 */
@RestController
public class CourseController {

    @Resource
    CourseDao courseDao;

    @RequestMapping("/courses")
    public List<Course> getAllCourses() {
        return courseDao.getAllCourses();
    }

    @RequestMapping("/course")
    public String newCourse(@RequestParam(value = "course") String courseName,
            @RequestParam(value = "hours") int hoursWeek) {
        Course course = new Course(courseName, hoursWeek);
        return courseDao.newCourse(course);

    }

    @RequestMapping("/course/by")
    public Course getCourse(@RequestParam(value = "idCourse") int idCourse) {
        return courseDao.getCourse(idCourse);
    }
    

}
