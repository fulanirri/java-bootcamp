/*the queries below are the ones wich I use for the views
KeyPoint 4 view_student_teachers_course
KeyPoint 5 view_student_course_final
KeyPoint 6 a) view_count_passed
KeyPoint 6 b) view_count_failed
KeyPoint 7 view_teacher_schedule

some of the queries are filtered with java to achieve the keypoint's target

*/

/*KeyPoint 4*/

create view view_student_teachers_course as select b.course,b.teacherLastName,b.teacherFirstName,
c.firstName,c.lastName from Course_has_Student a 
inner join Course b on b.idCourse = a.Course_idCourse
inner join Student c on c.regNum = a.Student_regNum ;


/*KeyPoint 5*/

create view view_student_course_final as select  b.lastName,b.firstName, c.course, a.`final` from Course_has_Student a  
inner join Student b on b.regNum = a.Student_regNum
inner join Course c  on c.idCourse = a.Course_idCourse order by b.lastName;

/*KeyPoint 6*/

create view view_count_passed  as select count(final) as count_passed from Course_has_Student 
where Course_has_Student.`final` >= 6;

create view view_count_failed as select count(final) as count_failed from Course_has_Student 
where Course_has_Student.`final` < 6;

/*KeyPoint 7*/

create view view_teacher_schedule as select a.teacherLastName, a.teacherFirstName,c.dayName,d.startHour,d.finishHour
from Schedule b 
inner join Course a on a.idCourse = b.idCourse
inner join `Hour` d on d.idHour = b.idHour
inner join WeekDay c on c.idWeekDay = b.idWeekDay;


