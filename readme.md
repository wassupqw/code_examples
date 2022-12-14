# Task 1

Для студента с именем student_59 вывести следующую информацию по всем его попыткам:

- информация о шаге: номер модуля, символ '.', позиция урока в модуле, символ '.', позиция шага в модуле;
порядковый номер попытки для каждого шага - определяется по возрастанию времени отправки попытки;
результат попытки;
- время попытки (преобразованное к формату времени) - определяется как разность между временем отправки попытки и времени ее начала, 
в случае если попытка длилась более 1 часа, то время попытки заменить на среднее время всех попыток пользователя по всем шагам без учета тех, 
которые длились больше 1 часа;
- относительное время попытки  - определяется как отношение времени попытки (с учетом замены времени попытки) к суммарному времени всех попыток  шага, 
округленное до двух знаков после запятой.

Столбцы назвать  Студент,  Шаг, Номер_попытки, Результат, Время_попытки и Относительное_время. Информацию отсортировать сначала по возрастанию id шага, 
а затем по возрастанию номера попытки (определяется по времени отправки попытки).

[Решение](https://github.com/wassupqw/code_examples/blob/main/sql/Task%201.sql)

# Task 2

Проанализировать, в каком порядке и с каким интервалом пользователь отправлял последнее верно выполненное задание каждого урока. 
Учитывать только студентов, прошедших хотя бы один шаг из всех трех уроков. В базе занесены попытки студентов  для трех уроков курса, 
поэтому анализ проводить только для этих уроков.

Для студентов прошедших как минимум по одному шагу в каждом уроке, найти последний пройденный шаг каждого урока - крайний шаг, и указать:

- имя студента;
- номер урока, состоящий из номера модуля и через точку позиции каждого урока в модуле;
- время отправки  - время подачи решения на проверку;
- разницу во времени отправки между текущим и предыдущим крайним шагом в днях, при этом для первого шага поставить прочерк ("-"), 
а количество дней округлить до целого в большую сторону.

[Решение](https://github.com/wassupqw/code_examples/blob/main/sql/Task%202.sql)


# Task 3

Посчитать среднее время, за которое пользователи проходят урок по следующему алгоритму:

- для каждого пользователя вычислить время прохождения шага как сумму времени, потраченного на каждую попытку (время попытки - это разница между 
временем отправки задания и временем начала попытки), при этом попытки, которые длились больше 4 часов не учитывать, так как пользователь 
мог просто оставить задание открытым в браузере, а вернуться к нему на следующий день;
- для каждого студента посчитать общее время, которое он затратил на каждый урок;
- вычислить среднее время выполнения урока в часах, результат округлить до 2-х знаков после запятой;
- вывести информацию по возрастанию времени, пронумеровав строки, для каждого урока указать номер модуля и его позицию в нем.

[Решение](https://github.com/wassupqw/code_examples/blob/main/sql/Task%203.sql)

# Task 4

Расчет показателя из двух таблиц и автоматическая рассылка результата.

[Решение](https://github.com/wassupqw/code_examples/blob/main/Python/Python.ipynb)

