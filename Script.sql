create database data_university;
use data_university;
CREATE TABLE `student` (
  `id` int PRIMARY KEY,
  `name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `person_id` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `second_address` varchar(255),
  `house_number` varchar(255),
  `birthday` date NOT NULL,
  `gender` varchar(255) NOT NULL,
  `faculty_id` int NOT NULL,
  `courses_id` int NOT NULL
);

CREATE TABLE `lecturer` (
  `id` int PRIMARY KEY,
  `name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `person_id` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `second_address` varchar(255),
  `house_number` varchar(255),
  `birthday` date NOT NULL,
  `gender` varchar(255) NOT NULL,
  `bank_account` varchar(255) NOT NULL,
  `rank_type` varchar(255) NOT NULL
);

CREATE TABLE `manager` (
  `id` int PRIMARY KEY,
  `name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `person_id` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `second_address` varchar(255),
  `house_number` varchar(255),
  `birthday` date NOT NULL,
  `gender` varchar(255) NOT NULL,
  `faculty_id` int NOT NULL
);

CREATE TABLE `faculty` (
  `id` int PRIMARY KEY,
  `faculty_name` varchar(255) NOT NULL
);

CREATE TABLE `courses` (
  `id` int PRIMARY KEY,
  `course_number` int NOT NULL
);

CREATE TABLE `faculty_courses` (
  `id` int PRIMARY KEY,
  `faculty_id` int NOT NULL,
  `courses_id` int NOT NULL
);

CREATE TABLE `subjects` (
  `id` int PRIMARY KEY,
  `subject_name` varchar(255) NOT NULL,
  `courses_id` int NOT NULL,
  `faculty_id` int
);

CREATE TABLE `subject_timetable` (
  `id` int PRIMARY KEY,
  `weekday` varchar(255) NOT NULL,
  `start_time` time NOT NULL
);

CREATE TABLE `lecturer_subject` (
  `id` int PRIMARY KEY,
  `lecturer_id` int NOT NULL,
  `subject_id` int NOT NULL,
  `subject_timetable_id` int NOT NULL
);

ALTER TABLE `student` ADD FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`id`);

ALTER TABLE `manager` ADD FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`id`);

ALTER TABLE `faculty_courses` ADD FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`id`);

ALTER TABLE `faculty_courses` ADD FOREIGN KEY (`courses_id`) REFERENCES `courses` (`id`);

ALTER TABLE `student` ADD FOREIGN KEY (`courses_id`) REFERENCES `courses` (`id`);

ALTER TABLE `subjects` ADD FOREIGN KEY (`courses_id`) REFERENCES `courses` (`id`);

ALTER TABLE `subjects` ADD FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`id`);

ALTER TABLE `lecturer_subject` ADD FOREIGN KEY (`lecturer_id`) REFERENCES `lecturer` (`id`);

ALTER TABLE `lecturer_subject` ADD FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`);

ALTER TABLE `lecturer_subject` ADD FOREIGN KEY (`subject_timetable_id`) REFERENCES `subject_timetable` (`id`);
