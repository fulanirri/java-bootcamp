package HighSchool.Pojos;
// Generated 09/02/2015 04:05:06 by Hibernate Tools 4.3.1


import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Teacher generated by hbm2java
 */
@Entity
@Table(name="Teacher"
    ,catalog="highschool"
)
public class Teacher  implements java.io.Serializable {


     private Integer idTeacher;
     private String firstName;
     private String lastName;
     private Date dateOfBirth;
     private Set<TeacherHasCourse> teacherHasCourses = new HashSet<TeacherHasCourse>(0);

    public Teacher() {
    }
    public Teacher(String firstName, String lastName){
        this.firstName = firstName;
       this.lastName = lastName;
    }
    public Teacher(String firstName, String lastName, Date dateOfBirth, Set<TeacherHasCourse> teacherHasCourses) {
       this.firstName = firstName;
       this.lastName = lastName;
       this.dateOfBirth = dateOfBirth;
       this.teacherHasCourses = teacherHasCourses;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)

    
    @Column(name="idTeacher", unique=true, nullable=false)
    public Integer getIdTeacher() {
        return this.idTeacher;
    }
    
    public void setIdTeacher(Integer idTeacher) {
        this.idTeacher = idTeacher;
    }

    
    @Column(name="firstName", length=45)
    public String getFirstName() {
        return this.firstName;
    }
    
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    
    @Column(name="lastName", length=45)
    public String getLastName() {
        return this.lastName;
    }
    
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    @Temporal(TemporalType.DATE)
    @Column(name="dateOfBirth", length=10)
    public Date getDateOfBirth() {
        return this.dateOfBirth;
    }
    
    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="teacher")
    public Set<TeacherHasCourse> getTeacherHasCourses() {
        return this.teacherHasCourses;
    }
    
    public void setTeacherHasCourses(Set<TeacherHasCourse> teacherHasCourses) {
        this.teacherHasCourses = teacherHasCourses;
    }




}

