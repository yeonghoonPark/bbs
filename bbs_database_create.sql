-- DB구축
-- DB : bbs
DROP DATABASE IF EXISTS bbs;
CREATE DATABASE bbs;
USE bbs;

-- TABLE1 : user
CREATE TABLE user (
	userID VARCHAR(20), 
	userPassword VARCHAR(20) NOT NULL, 
	userName VARCHAR(20) NOT NULL, 
	userAddress VARCHAR(50) , 
	userBirthday DATE, 
	userGender VARCHAR(5),
	userEmail VARCHAR(45),
	userPhone VARCHAR(20) NOT NULL,
	PRIMARY KEY (userID)
);

-- TABLE2 : notice
CREATE TABLE notice (
	noticeID INTEGER NOT NULL,
	noticeTit VARCHAR(30) NOT NULL,
	noticeContent VARCHAR(5000) ,
	noticeName VARCHAR(20) NOT NULL,
	noticeDate DATE NOT NULL,
    PRIMARY KEY (noticeID)
);


