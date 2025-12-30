
-- PHẦN I: TẠO CSDL & BẢNG
CREATE DATABASE online_learning_system;
USE online_learning_system;

CREATE TABLE student (
    student_id CHAR(10) PRIMARY KEY,
    full_name VARCHAR(50) NOT NULL,
    birth_date DATE,
    email VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE teacher (
    teacher_id CHAR(10) PRIMARY KEY,
    full_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE course (
    course_id CHAR(10) PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    description VARCHAR(255),
    total_sessions INT,
    teacher_id CHAR(10),
    FOREIGN KEY (teacher_id) REFERENCES teacher(teacher_id)
);

CREATE TABLE enrollment (
    student_id CHAR(10),
    course_id CHAR(10),
    enroll_date DATE,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES student(student_id),
    FOREIGN KEY (course_id) REFERENCES course(course_id)
);

CREATE TABLE score (
    student_id CHAR(10),
    course_id CHAR(10),
    mid_score FLOAT CHECK (mid_score BETWEEN 0 AND 10),
    final_score FLOAT CHECK (final_score BETWEEN 0 AND 10),
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES student(student_id),
    FOREIGN KEY (course_id) REFERENCES course(course_id)
);

-- PHẦN II: THÊM DỮ LIỆU
INSERT INTO student VALUES
('SV01','Nguyen Van A','2002-01-10','a@gmail.com'),
('SV02','Tran Thi B','2002-03-12','b@gmail.com'),
('SV03','Le Van C','2001-05-20','c@gmail.com'),
('SV04','Pham Thi D','2002-07-15','d@gmail.com'),
('SV05','Hoang Van E','2001-09-30','e@gmail.com');

INSERT INTO teacher VALUES
('GV01','Nguyen Thay 1','t1@gmail.com'),
('GV02','Nguyen Thay 2','t2@gmail.com'),
('GV03','Nguyen Thay 3','t3@gmail.com'),
('GV04','Nguyen Thay 4','t4@gmail.com'),
('GV05','Nguyen Thay 5','t5@gmail.com');

INSERT INTO course VALUES
('C01','SQL Co Ban','Hoc SQL',10,'GV01'),
('C02','Java','Lap trinh Java',12,'GV02'),
('C03','Python','Lap trinh Python',15,'GV03'),
('C04','Web','HTML CSS JS',14,'GV04'),
('C05','CSDL','Co so du lieu',11,'GV01');

INSERT INTO enrollment VALUES
('SV01','C01','2024-01-01'),
('SV01','C02','2024-01-02'),
('SV02','C01','2024-01-03'),
('SV03','C03','2024-01-04'),
('SV04','C04','2024-01-05');

INSERT INTO score VALUES
('SV01','C01',7,8),
('SV01','C02',6,7),
('SV02','C01',8,9),
('SV03','C03',7.5,8),
('SV04','C04',6.5,7);


-- PHẦN III: CẬP NHẬT
UPDATE student
SET email = 'newa@gmail.com'
WHERE student_id = 'SV01';

UPDATE course
SET description = 'Khoa hoc SQL nang cao'
WHERE course_id = 'C01';

UPDATE score
SET final_score = 9
WHERE student_id = 'SV02' AND course_id = 'C01';


-- PHẦN IV: XÓA DỮ LIỆU
DELETE FROM score
WHERE student_id = 'SV04' AND course_id = 'C04';

DELETE FROM enrollment
WHERE student_id = 'SV04' AND course_id = 'C04';


-- PHẦN V: TRUY VẤN
SELECT * FROM student;
SELECT * FROM teacher;
SELECT * FROM course;
SELECT * FROM enrollment;
SELECT * FROM score;
