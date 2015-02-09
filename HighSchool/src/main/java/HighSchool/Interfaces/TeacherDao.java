package HighSchool.Interfaces;

import HighSchool.Pojos.Teacher;
import java.util.Date;
import java.util.List;

/**
 *
 * @author german
 */
public interface TeacherDao {
    
    public List<Teacher> getAllTeachers();
    public String newTeacher(Teacher teacher);
    public Teacher getTeacher(int idTeacher);
    public String setTeacherDateOfBirth(int idTeacher,Date dateOfBirth);
    public String addTeacherToCourse(int idTeacher, int idCourse);

}
