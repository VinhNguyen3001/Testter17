CREATE TABLE `account` (
  `AccountID` int NOT NULL AUTO_INCREMENT,
  `Email` varchar(50) DEFAULT NULL,
  `UserName` varchar(50) DEFAULT NULL,
  `FullName` varchar(50) DEFAULT NULL,
  `DepartmentID` int DEFAULT NULL,
  `PostionID` int DEFAULT NULL,
  `CreateDate` date DEFAULT NULL,
  PRIMARY KEY (`AccountID`),
  KEY `DepartmentID` (`DepartmentID`),
  KEY `PostionID` (`PostionID`),
  CONSTRAINT `account_ibfk_1` FOREIGN KEY (`DepartmentID`) REFERENCES `department` (`DepartmentID`),
  CONSTRAINT `account_ibfk_2` FOREIGN KEY (`PostionID`) REFERENCES `position` (`PositionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `answer` (
  `AnswerID` int NOT NULL AUTO_INCREMENT,
  `Content` varchar(1000) DEFAULT NULL,
  `QuestionID` int DEFAULT NULL,
  `isCorrect` enum('true','false') DEFAULT NULL,
  PRIMARY KEY (`AnswerID`),
  KEY `QuestionID` (`QuestionID`),
  CONSTRAINT `answer_ibfk_1` FOREIGN KEY (`QuestionID`) REFERENCES `question` (`QuestionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `categoryquestion` (
  `CategoryID` int NOT NULL AUTO_INCREMENT,
  `CategoryName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`CategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `department` (
  `DepartmentID` int NOT NULL AUTO_INCREMENT,
  `DepartmentName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`DepartmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `exam` (
  `ExamID` int NOT NULL AUTO_INCREMENT,
  `Code` int DEFAULT NULL,
  `Title` varchar(50) DEFAULT NULL,
  `CategoryID` int DEFAULT NULL,
  `CreatorID` int DEFAULT NULL,
  `CreateDate` date DEFAULT NULL,
  PRIMARY KEY (`ExamID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `examquestion` (
  `ExamID` int DEFAULT NULL,
  `QuestionID` int DEFAULT NULL,
  KEY `ExamID` (`ExamID`),
  KEY `QuestionID` (`QuestionID`),
  CONSTRAINT `examquestion_ibfk_1` FOREIGN KEY (`ExamID`) REFERENCES `exam` (`ExamID`),
  CONSTRAINT `examquestion_ibfk_2` FOREIGN KEY (`QuestionID`) REFERENCES `question` (`QuestionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `group` (
  `GroupID` int NOT NULL AUTO_INCREMENT,
  `GroupName` varchar(50) DEFAULT NULL,
  `CreatorID` int DEFAULT NULL,
  `CreateDate` date DEFAULT NULL,
  PRIMARY KEY (`GroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `groupid` (
  `GroupID` int DEFAULT NULL,
  `AccountID` int DEFAULT NULL,
  `JoinDate` date DEFAULT NULL,
  KEY `GroupID` (`GroupID`),
  KEY `AccountID` (`AccountID`),
  CONSTRAINT `groupid_ibfk_1` FOREIGN KEY (`GroupID`) REFERENCES `group` (`GroupID`),
  CONSTRAINT `groupid_ibfk_2` FOREIGN KEY (`AccountID`) REFERENCES `account` (`AccountID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `position` (
  `PositionID` int NOT NULL AUTO_INCREMENT,
  `PositionName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`PositionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `question` (
  `QuestionID` int NOT NULL AUTO_INCREMENT,
  `Content` varchar(1000) DEFAULT NULL,
  `CategoryID` int DEFAULT NULL,
  `TypeID` int DEFAULT NULL,
  `CreatorID` int DEFAULT NULL,
  `CreateDate` date DEFAULT NULL,
  PRIMARY KEY (`QuestionID`),
  KEY `CategoryID` (`CategoryID`),
  KEY `TypeID` (`TypeID`),
  CONSTRAINT `question_ibfk_1` FOREIGN KEY (`CategoryID`) REFERENCES `categoryquestion` (`CategoryID`),
  CONSTRAINT `question_ibfk_2` FOREIGN KEY (`TypeID`) REFERENCES `typequestion` (`TypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `typequestion` (
  `TypeID` int NOT NULL AUTO_INCREMENT,
  `TypeName` enum('essay','multiple_choice') DEFAULT NULL,
  PRIMARY KEY (`TypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
