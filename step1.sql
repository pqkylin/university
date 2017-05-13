-- 首先创建department表格，depa_name为主键
CREATE TABLE `department` (
  `depa_name` varchar(10) NOT NULL,
  `building` varchar(30) DEFAULT NULL,
  `budget` int(11) DEFAULT NULL,
  PRIMARY KEY (`depa_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 然后创建student表，主键为ID，外键为depa_name
CREATE TABLE `student` (
  `ID` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `sex` varchar(2) DEFAULT NULL,
  `depa_name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_student_1_idx` (`depa_name`),
  CONSTRAINT `fk_student_1` FOREIGN KEY (`depa_name`) REFERENCES `department` (`depa_name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 最后创建exam表，主键为student_ID,exam_name，外键为student_ID（就是student表中的ID）
CREATE TABLE `exam` (
  `student_ID` int(11) NOT NULL,
  `exam_name` varchar(45) NOT NULL,
  `grade` int(3) DEFAULT NULL,
  PRIMARY KEY (`student_ID`,`exam_name`),
  CONSTRAINT `fk_exam_1` FOREIGN KEY (`student_ID`) REFERENCES `student` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


