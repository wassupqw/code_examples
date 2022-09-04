with 
data_1 as (
    select student_name, module_id, lesson_position, 
           max(submission_time) as t
    from student
    inner join step_student using(student_id)
    inner join step using(step_id)
    inner join lesson using(lesson_id)
    where result = 'correct'
    group by 1, 2, 3),
three as (
    select student_name 
    from data_1
    group by student_name
    having count(lesson_position) = 3)
select student_name as Студент,
       concat(module_id, '.', lesson_position) as Урок,
       from_unixtime(t) as Макс_время_отправки,
       ifnull(ceil((t - lag(t) over (partition by student_name order by t))/(60*60*24)),'-') as Интервал
from data_1
     inner join three using(student_name)
order by 1, 3;
