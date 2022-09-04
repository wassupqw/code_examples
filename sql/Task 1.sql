set @avg_time = (select round(avg(submission_time - attempt_time))
                 from student
                 inner join step_student using(student_id)
                 where student_name = 'student_59' and submission_time - attempt_time <= 3600);                 
with st as (
    select student_name, module_id, lesson_position, step_position, step_id, 
           result, submission_time - attempt_time as rate, attempt_time
    from student
    inner join step_student using(student_id)
    inner join step using(step_id)
    inner join lesson using(lesson_id)
    where student_name = 'student_59')
select student_name as Студент,  
       concat(module_id, '.', lesson_position, '.', step_position) as Шаг, 
       dense_rank() over (partition by concat(module_id, '.', lesson_position, '.', step_position) order by attempt_time) as Номер_попытки, 
       result as Результат, 
       sec_to_time(round(if(rate<3600, rate, @avg_time))) as Время_попытки,
       round(if(rate<3600, rate, @avg_time) / 
             sum(if(rate<3600, rate, @avg_time)) over (partition by step_id)*100,2) as Относительное_время
from st
order by step_id, 3;
