-- Домашка 5.
-- Примеры аналитических запросов для DWH (пункт 6 отчёта)

-- 1. Средний балл по предметам - какие предметы в среднем сложнее или проще
SELECT dim_lesson.subject_name, AVG(fact_student_lesson.grade_value) AS avg_grade
FROM fact_student_lesson
JOIN dim_lesson 
ON fact_student_lesson.lesson_sk = dim_lesson.lesson_sk
GROUP BY dim_lesson.subject_name;

-- 2. Количество студентов в каждой группе - сколько студентов учится в каждой группе
SELECT dim_group.group_name, COUNT(dim_student.student_sk) AS total_students
FROM dim_student
JOIN dim_group 
ON dim_student.current_group_name = dim_group.group_name
GROUP BY dim_group.group_name;


-- 3. Средний балл по группам - какие студенческие группы учатся лучше, а какие хуже
SELECT dim_group.group_name, AVG(fact_student_lesson.grade_value) AS avg_grade
FROM fact_student_lesson
JOIN dim_group 
ON fact_student_lesson.group_sk = dim_group.group_sk
GROUP BY dim_group.group_name;


-- 4. Средний балл по полу студентов - есть ли различия в оценках между студентами разных полов
SELECT dim_student.gender, AVG(fact_student_lesson.grade_value) AS avg_grade
FROM fact_student_lesson
JOIN dim_student 
ON fact_student_lesson.student_sk = dim_student.student_sk
GROUP BY dim_student.gender;


-- 5.Ученики с высоким средним баллом (≥9) - какие студенты  в каждой группе учатся на средний балл 9 и выше

SELECT dim_group.group_name,
       dim_student.first_name,
       dim_student.last_name,
       AVG(fact_student_lesson.grade_value) AS avg_grade
FROM fact_student_lesson
JOIN dim_student 
ON fact_student_lesson.student_sk = dim_student.student_sk
JOIN dim_group 
ON fact_student_lesson.group_sk = dim_group.group_sk
GROUP BY dim_group.group_name, dim_student.first_name, dim_student.last_name
HAVING AVG(fact_student_lesson.grade_value) >= 9
ORDER BY dim_group.group_name, avg_grade DESC;



-------- Это скрипт для создания и наполнения таблиц для данного дз, если нужно протестировать
CREATE TABLE dim_student (
    student_sk BIGINT PRIMARY KEY,
    source_student_id BIGINT NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    gender CHAR(1) NOT NULL,
    birth_year INT,
    current_group_name VARCHAR(50)
);

CREATE TABLE dim_lesson (
    lesson_sk BIGINT PRIMARY KEY,
    source_lesson_id BIGINT NOT NULL,
    subject_name VARCHAR(100) NOT NULL,
    classroom_number VARCHAR(20),
    building_name VARCHAR(100),
    faculty_name VARCHAR(100),
    university_name VARCHAR(150)
);

CREATE TABLE dim_teacher (
    teacher_sk BIGINT PRIMARY KEY,
    source_teacher_id BIGINT NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    position VARCHAR(50),
    department VARCHAR(100),
    faculty_name VARCHAR(100)
);

CREATE TABLE dim_group (
    group_sk BIGINT PRIMARY KEY,
    source_group_id BIGINT NOT NULL,
    group_name VARCHAR(50) NOT NULL,
    curator_teacher_name VARCHAR(150),
    start_year INT
);

CREATE TABLE fact_student_lesson (
    fact_id BIGINT PRIMARY KEY,
    student_sk BIGINT NOT NULL REFERENCES dim_student(student_sk),
    lesson_sk BIGINT NOT NULL REFERENCES dim_lesson(lesson_sk),
    teacher_sk BIGINT NOT NULL REFERENCES dim_teacher(teacher_sk),
    group_sk BIGINT NOT NULL REFERENCES dim_group(group_sk),
    event_time TIMESTAMP NOT NULL,
    grade_value INT NOT NULL,
    is_pass BOOLEAN
);
