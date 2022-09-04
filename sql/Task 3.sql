with 
steps as (
    select student_id,
           step_id,
           sum(submission_time - attempt_time) as all_steps
    from step_student
    where submission_time - attempt_time <= 4 * 3600
    group by student_id, step_id),
lessons as (
    select student_id, 
           l.lesson_id as lesson_id,
           sum(all_steps)/3600 as all_lessons
    from steps as s
    inner join step as ss
    on s.step_id = ss.step_id
    inner join lesson as l
    on l.lesson_id = ss.lesson_id
    group by student_id, l.lesson_id),
all_l as (
    select lesson_id,
           round(avg(all_lessons),2) as l_avg
    from lessons
    group by lesson_id)
select 
        row_number()
        over(order by l_avg) as Номер,
        concat(m.module_id, '.', lesson_position, ' ', lesson_name) as Урок, 
        l_avg as Среднее_время
from all_l as a
inner join lesson as l
on l.lesson_id = a.lesson_id
inner join module as m
on l.module_id = m.module_id;
