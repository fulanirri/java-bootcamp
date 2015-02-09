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
import com.fasterxml.jackson.annotation.JsonIgnore;

/**
 * Student generated by hbm2java
 */
@Entity
@Table(name="Student"
    ,catalog="highschool"
)
public class Student  implements java.io.Serializable {


     private Integer regNum;
     private String firstName;
     private String lastName;
     private Date dateOfBirth;
     private Set<CourseHasStudent> courseHasStudents = new HashSet<CourseHasStudent>(0);

    public Student() {
    }
    public Student(String firstName, String lastName){
        this.firstName = firstName;
       this.lastName = lastName;
    }
    public Student(String firstName, String lastName, Date dateOfBirth, Set<CourseHasStudent> courseHasStudents) {
       this.firstName = firstName;
       this.lastName = lastName;
       this.dateOfBirth = dateOfBirth;
       this.courseHasStudents = courseHasStudents;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)

    
    @Column(name="regNum", unique=true, nullable=false)
    public Integer getRegNum() {
        return this.regNum;
    }
    
    public void setRegNum(Integer regNum) {
        this.regNum = regNum;
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

@OneToMany(fetch=FetchType.LAZY, mappedBy="student")
    public Set<CourseHasStudent> getCourseHasStudents() {
        return this.courseHasStudents;
    }
    
    public void setCourseHasStudents(Set<CourseHasStudent> courseHasStudents) {
        this.courseHasStudents = courseHasStudents;
    }




}


