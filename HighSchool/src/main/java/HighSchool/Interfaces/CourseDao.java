package HighSchool.Interfaces;

import HighSchool.Pojos.Course;
import java.util.List;

/**
 *
 * @author german
 */
public interface CourseDao {
 
   public List<Course> getAllCourses();
    public String newCourse(Course course);
    public Course getCourse(int idCourse);
    public String addTeacherToCourse(int idTeacher,int idCourse);
    
}
