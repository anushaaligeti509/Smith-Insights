-- Selecting the database:
USE BUDT702_Project_0503_04


-- SQL DROP TABLE:
DROP TABLE IF EXISTS [Smith_Ranking.Rate]
DROP TABLE IF EXISTS [Smith_Ranking.Enroll]
DROP TABLE IF EXISTS [Smith_Ranking.Employ]
DROP TABLE IF EXISTS [Smith_Ranking.Teach]
DROP TABLE IF EXISTS [Smith_Ranking.Program]
DROP TABLE IF EXISTS [Smith_Ranking.Student]
DROP TABLE IF EXISTS [Smith_Ranking.Faculty]
DROP TABLE IF EXISTS [Smith_Ranking.Year]
DROP TABLE IF EXISTS [Smith_Ranking.Source]

-- Creating the Program table
CREATE TABLE [Smith_Ranking.Program]  (
	prId CHAR (4) NOT NULL,
	prName VARCHAR (30) NOT NULL,
	prDegType VARCHAR (3),
	prType VARCHAR (16),
	prEmpRate INTEGER,
	prAvgStartSalary INTEGER,
	prPercentJobGrowth INTEGER,
	prNumofCredits INTEGER, 
	prAvgGPA DECIMAL (3,2),
	prNumofFaculty INTEGER,  
	CONSTRAINT pk_Program_prId PRIMARY KEY (prId)
	);


-- Creating the Student table
CREATE TABLE [Smith_Ranking.Student](
	stuId VARCHAR(9) NOT NULL,
	stuFirstName VARCHAR(20) NOT NULL,
	stuMidInitial VARCHAR(1),
	stuLastName VARCHAR(20) NOT NULL,
	stuGPA DECIMAL(3,2),
	stuGMAT INTEGER,
	stuGRE INTEGER,
	stuEnrolLYear DATE NOT NULL,
	stuSemester VARCHAR (6),
	stuGradYear DATE,
	stuGradSemester VARCHAR (6),
	CONSTRAINT pk_Student_stuId PRIMARY KEY (stuId)
	);

-- Creating the Source table
CREATE TABLE [Smith_Ranking.Source] (
	souId CHAR (3) NOT NULL,
	souName VARCHAR (20) NOT NULL,
	souRankType CHAR (15),
	CONSTRAINT pk_Source_souId PRIMARY KEY (souId)
	);

-- Creating the Year table
CREATE TABLE [Smith_Ranking.Year]  (
	rankYear DATE NOT NULL, 
	CONSTRAINT pk_Year_rankYear PRIMARY KEY (rankYear)
	);

-- Creating the Faculty table
CREATE TABLE [Smith_Ranking.Faculty] (
	facId VARCHAR (9) NOT NULL,
	facFirstName VARCHAR (20) NOT NULL,
	facMidInitial VARCHAR (3) ,
	facLastName VARCHAR (20) NOT NULL,
	facCourse VARCHAR (40),
	facDesgination VARCHAR (20),
	facEmailAddress VARCHAR (40),
	CONSTRAINT pk_Faculty_facId PRIMARY KEY (facId)
	);

-- Creating the Enroll table
CREATE TABLE [Smith_Ranking.Enroll]  (
	stuId VARCHAR(9) NOT NULL,
	prId CHAR (4) NOT NULL,
	enrolDate DATE,
	CONSTRAINT pk_Enroll_stuId_prId PRIMARY KEY (stuId, prId),
	CONSTRAINT fk_Enroll_stuId FOREIGN KEY (stuId)
		REFERENCES [Smith_Ranking.Student] (stuId)
		ON DELETE NO ACTION ON UPDATE CASCADE,
	CONSTRAINT fk_Enroll_prId FOREIGN KEY (prId)
		REFERENCES [Smith_Ranking.Program] (prId)
		ON DELETE NO ACTION ON UPDATE CASCADE
	);

--Creating the Rate table
CREATE	TABLE	[Smith_Ranking.Rate]	( 
	prId	CHAR (4)	NOT	NULL, 
	souId CHAR (3) NOT NULL, 
	rankYear	DATE	NOT	NULL, 
	ranking	INTEGER, 
	CONSTRAINT	pk_Rate_prId_souId_rankYear PRIMARY	KEY	(prId, souId, rankYear),
	CONSTRAINT	fk_Rate_prId	FOREIGN	KEY	(prId)
		REFERENCES	[Smith_Ranking.Program]	(prId)	 
		ON	DELETE NO ACTION ON	UPDATE	NO ACTION, 
	CONSTRAINT	fk_Rate_souId	FOREIGN	KEY	(souId) 
		REFERENCES	[Smith_Ranking.Source]	(souId) 
		ON	DELETE NO ACTION ON	UPDATE NO ACTION, 
	CONSTRAINT fk_Rate_rankYear FOREIGN KEY (rankYear) 
		REFERENCES [Smith_Ranking.Year] (rankYear)
		ON	DELETE NO ACTION ON UPDATE NO ACTION 
		);

-- Creating the Employ table
CREATE TABLE [Smith_Ranking.Employ] (
	facId VARCHAR (9) NOT NULL,
	prId CHAR (4) NOT NULL,
	CONSTRAINT pk_Employ_facId_prId PRIMARY KEY (facId, prId),
	CONSTRAINT fk_Employ_facId FOREIGN KEY (facId)
		REFERENCES [Smith_Ranking.Faculty] (facId)
		ON DELETE NO ACTION ON UPDATE NO ACTION,
	CONSTRAINT fk_Employ_prId FOREIGN KEY (prId)
		REFERENCES [Smith_Ranking.Program] (prId)
		ON DELETE NO ACTION ON UPDATE NO ACTION
		) ; 

--Creating the Teach table
CREATE TABLE [Smith_Ranking.Teach] (
	facId VARCHAR (9) NOT NULL,
	stuId VARCHAR(9) NOT NULL,
	CONSTRAINT pk_Teach_facId_stuId PRIMARY KEY (facId, stuId),
	CONSTRAINT fk_Teach_facId FOREIGN KEY (facId)
		REFERENCES [Smith_Ranking.Faculty] (facId)
		ON DELETE NO ACTION ON UPDATE NO ACTION,
	CONSTRAINT fk_Teach_stuId FOREIGN KEY (stuId)
		REFERENCES [Smith_Ranking.Student] (stuId)
		ON DELETE NO ACTION ON UPDATE NO ACTION
		);


-- Actual data for MSIS 2023 Students. Due to privacy reasons, actual studentIds are unavailable. We have augmented studentIds as the a primary key.

INSERT INTO [Smith_Ranking.Student] VALUES ('111111111', 'Rohit', NULL, 'Abbireddi', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111112', 'Kushal', NULL, 'Acharya', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111113', 'Ajith', NULL, 'Adithya R K', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111114', 'Anusha', NULL, 'Aligeti', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111115', 'Rohit', NULL, 'Ananthan', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111116', 'Pranayreddy', NULL, 'Anthareddy', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111117', 'Gabriel', NULL, 'Assan', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111118', 'Puneetha', NULL, 'B', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111119', 'Dipesh', NULL, 'Balani', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111120', 'Matthew', NULL, 'Bastian', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111121', 'Akshay', NULL, 'Belnekar', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111122', 'Shruti', NULL, 'Bishnoi', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111123', 'Pavol', NULL, 'Britvch', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111124', 'Farah', NULL, 'Bushra', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111125', 'Aniket', NULL, 'Chafekar', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111126', 'Erik', NULL, 'Chang', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111127', 'Jainam', NULL, 'Chhadwa', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111128', 'Vineet', NULL, 'Chheda', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111129', 'Jessica', NULL, 'Choong', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111130', 'Miranda', NULL, 'Chung', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111131', 'Deep', NULL, 'Dalsaniya', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111132', 'Sakshat', NULL, 'Darne', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111133', 'Ellis', NULL, 'Deng', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111134', 'Shaunak', NULL, 'Dhande', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111135', 'Aliki', NULL, 'Dimitoglou', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111136', 'Ansh', NULL, 'Dugar', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111137', 'Srinidhi', NULL, 'Elkicherla', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111138', 'Delvin', NULL, 'Eluvathingal', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111139', 'Andrea', NULL, 'Espinoza Jones', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111140', 'Rachita', NULL, 'Fatehpuria', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111141', 'Salina', NULL, 'Fessehazion', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111142', 'Xylon', NULL, 'Funes', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111143', 'Yash', NULL, 'Gadhiya', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111144', 'Amrutha', NULL, 'Gandham', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111145', 'Saketh', NULL, 'Gangavaram', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111146', 'Huan', NULL, 'Gao', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111147', 'Helena', NULL, 'Getachew', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111148', 'Siddhartha', NULL, 'Ghosh', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111149', 'Jasmit', NULL, 'Singh Gill', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111150', 'Prashant', NULL, 'Goswami', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111151', 'Kunal', NULL, 'Gulati', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111152', 'Aviral', NULL, 'Gupta', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111153', 'Divisha', NULL, 'Gupta', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111154', 'Niharika', NULL, 'Gupta', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111155', 'Aarya', NULL, 'Hari', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111156', 'Vaibhavi', NULL, 'Hedaoo', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111157', 'Rakshanda', NULL, 'Hedawoo', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111158', 'Isabella', NULL, 'Herold', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111159', 'Kevin', NULL, 'Houck', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111160', 'Weslee', NULL, 'Hwang', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111161', 'Nishok', NULL, 'Ilangovan', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111162', 'Arnav', NULL, 'Jain', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111163', 'Divya', NULL, 'Jain', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111164', 'Mohit', NULL, 'Jain', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111165', 'Samson', NULL, 'Jiya', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111166', 'Hitaishi', NULL, 'Joshi', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111167', 'Ishita', NULL, 'Joshi', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111168', 'Niharika', NULL, 'Kadam', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111169', 'Rohan', NULL, 'Kalal', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111170', 'Aditya', NULL, 'Kamath', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111171', 'Peter', NULL, 'Karabatis', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111172', 'Zeba', NULL, 'Karkhanawala', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111173', 'Pranav', NULL, 'Karmarkar', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111174', 'Harshit', NULL, 'Kavathia', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111175', 'Ramyakoumudi', NULL, 'Kaveri', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111176', 'Arjun', NULL, 'Kaveti', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111177', 'Arusa', NULL, 'Khalfay', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111178', 'Arhab', NULL, 'Khan', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111179', 'Hibah', NULL, 'Khan', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111180', 'Siddharth', NULL, 'Khare', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111181', 'Fuad', NULL, 'Khasiyev', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111182', 'Shamit', NULL, 'Kotak', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111183', 'Sairamnath', NULL, 'Krishnan', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111184', 'Andreas', NULL, 'Krogh', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111185', 'Siddharth', NULL, 'Kulkarni', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111186', 'Nittesh', NULL, 'Kumar', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111187', 'Bhuvankrishna', NULL, 'Kunnath Balakrishnan', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111188', 'Farhaan', NULL, 'Lalit', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111189', 'Shiv', NULL, 'Lanka', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111190', 'Harry', NULL, 'Leeser', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111191', 'Serene', NULL, 'Li', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111192', 'Zhanyi', NULL, 'Lin', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111193', 'Qingrui', NULL, 'Lou', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111194', 'Akshit', NULL, 'Malik', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111196', 'Keshin', NULL, 'Mehta', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111197', 'Siddhesh', NULL, 'Mishra', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111198', 'Siddharth', NULL, 'Modi', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111199', 'Asheer', NULL, 'Mogal', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111200', 'Joshua', NULL, 'Mohammed', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111201', 'Pradyum', NULL, 'Mohta', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111202', 'Penchala', NULL, 'Mullaputi', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111203', 'Sneha', NULL, 'Murali', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111204', 'Aromal', NULL, 'Nair', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111205', 'Navida', NULL, 'Nandakumar', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111206', 'Shriya', NULL, 'Natta', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111208', 'Dhanushree', NULL, 'Neelapu', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111209', 'Ilyas', NULL, 'Nur', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111210', 'Emmanuel', NULL, 'Ojamo', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111211', 'Navneeth', NULL, 'Oruganti', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111212', 'Jaya', NULL, 'Pabbisetty', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111213', 'Ritesh', NULL, 'Pachgade', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111214', 'Krishang', NULL, 'Parakh', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111215', 'Natasha', NULL, 'Pashupathi', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111216', 'Harshil', NULL, 'Patel', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111217', 'Sumitkumar', NULL, 'Patel', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111218', 'Rutwik', NULL, 'Patil', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111219', 'Sandnya', NULL, 'Patil', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111220', 'Adit', NULL, 'Pawar', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111221', 'Thomas', NULL, 'Patrick Pearce', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111222', 'Aswin', NULL, 'Ramesh', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111223', 'Sai', NULL, 'Ramireddygari', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111224', 'Rajat', NULL, 'Rautan', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111225', 'Poojaa', NULL, 'Ravi Kumar', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111226', 'Tripatjot', NULL, 'Saggu', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111227', 'Rutuja', NULL, 'Samant', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111228', 'Rohit', NULL, 'Sangem', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111229', 'Naman', NULL, 'Sanghavi', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111230', 'Swaraj', NULL, 'Sanjay', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111231', 'Jayanth', NULL, 'Sankar', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111232', 'Akshat', NULL, 'Shah', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111233', 'Hetvi', NULL, 'Shah', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111234', 'Jeet', NULL, 'Shah', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111235', 'Krupa', NULL, 'Shah', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111236', 'Sahat', NULL, 'Shah', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111237', 'Tirth', NULL, 'Shah', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111238', 'Ariz', NULL, 'Shaikh', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111239', 'Siddharth', NULL, 'Shankar', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111240', 'Paul', NULL, 'Shapiro', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111241', 'Anuj', NULL, 'Sharma', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111242', 'Shivam', NULL, 'Sharma', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111243', 'Aniruddha', NULL, 'Shelke', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111244', 'Abhishek', NULL, 'Shetty', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111245', 'Yash', NULL, 'Shetty', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111246', 'Saurabh', NULL, 'Shinde', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111247', 'Venkatesh', NULL, 'Shirbhate', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111248', 'Shivam', NULL, 'Shivam', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111249', 'Stuti', NULL, 'Shrimal', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111250', 'Rohan', NULL, 'Sivarapu', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111251', 'Srigugan', NULL, 'Sivasubramani', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111252', 'Krithika', NULL, 'Somasekhar', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111253', 'Bharath', NULL, 'Sreekumar', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111254', 'Srinivas', NULL, 'Varma Chintalapati', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111255', 'Kangcheng', NULL, 'Su', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111256', 'Sreelakshmi', NULL, 'Suresh', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111257', 'Xinming', NULL, 'Tan', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111258', 'Palak', NULL, 'Tandel', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111259', 'Yimin', NULL, 'Tang', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111260', 'Akshad', NULL, 'Thole', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111261', 'Abel', NULL, 'Thomas', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111262', 'Sumedh', NULL, 'Tirodkar', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111263', 'Venkatesh', NULL, 'Tripuraneni', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111264', 'Balaji', NULL, 'Udayakumar', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111265', 'Omonegho', NULL, 'Ugheoke', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111266', 'Sravya', NULL, 'Veldurthi', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111267', 'Sandeepkumar', NULL, 'Vijaya Kumar', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111268', 'Siddhant', NULL, 'Virkar', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111269', 'Jiayi', NULL, 'Wang', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111270', 'Wei', NULL, 'Wang', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111271', 'Caleb', NULL, 'Wilson', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111272', 'Huidan', NULL, 'Wu', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111273', 'Ning', NULL, 'Xu', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111274', 'Sanskriti', NULL, 'Yadav', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111275', 'Hari', NULL, 'Yadlapalli', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111276', 'Sung-Jen', NULL, 'Yen', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111277', 'Ruijia', NULL, 'Yu', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111278', 'Aashay', NULL, 'Zanpure', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111279', 'Tingli', NULL, 'Zhang', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111280', 'Yuntian', NULL, 'Zhang', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('111111281', 'Yue', NULL, 'Zhao', NULL, NULL, NULL, '2023', 'Fall', '2024', 'Spring' )

-- Inserting actual data for MBA 2022 Students

INSERT INTO [Smith_Ranking.Student] VALUES ('222222220', 'Stephen', NULL, 'Alexander', NULL, NULL, NULL, '2022', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('222222221', 'Oluwaseun', NULL, 'Badmus', NULL, NULL, NULL, '2022', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('222222222', 'Woon', NULL, 'Baek', NULL, NULL, NULL, '2022', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('222222223', 'Anuja', NULL, 'Balaji', NULL, NULL, NULL, '2022', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('222222224', 'Christine', NULL, 'Bangura', NULL, NULL, NULL, '2022', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('222222225', 'Matthew', NULL, 'Bizet', NULL, NULL, NULL, '2022', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('222222226', 'Tydearian', NULL, 'Cocroft', NULL, NULL, NULL, '2022', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('222222227', 'Oluwafemi', NULL, 'Elias', NULL, NULL, NULL, '2022', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('222222228', 'Jonathan', NULL, 'Fogg', NULL, NULL, NULL, '2022', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('222222229', 'Tommy', NULL, 'Hwang', NULL, NULL, NULL, '2022', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('222222230', 'Shingo', NULL, 'Ito', NULL, NULL, NULL, '2022', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('222222231', 'Abiola', NULL, 'James', NULL, NULL, NULL, '2022', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('222222232', 'Naien', NULL, 'Jiang', NULL, NULL, NULL, '2022', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('222222233', 'Kilsoo', NULL, 'Lee', NULL, NULL, NULL, '2022', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('222222234', 'Haoran', NULL, 'Li', NULL, NULL, NULL, '2022', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('222222235', 'Wilburn', NULL, 'Logan', NULL, NULL, NULL, '2022', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('222222236', 'Courtney', NULL, 'McClammy', NULL, NULL, NULL, '2022', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('222222237', 'Sharjeel', NULL, 'Nawaz', NULL, NULL, NULL, '2022', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('222222238', 'Youngtaek', NULL, 'Oh', NULL, NULL, NULL, '2022', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('222222239', 'Daisuke', NULL, 'Otsuka', NULL, NULL, NULL, '2022', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('222222240', 'Prathiba', NULL, 'Pandiarajan', NULL, NULL, NULL, '2022', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('222222241', 'Ian', NULL, 'Potter', NULL, NULL, NULL, '2022', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('222222242', 'Paulo', NULL, 'Prochno', NULL, NULL, NULL, '2022', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('222222243', 'Adam', NULL, 'Rabon', NULL, NULL, NULL, '2022', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('222222244', 'Durga', NULL, 'Ramamoorthy', NULL, NULL, NULL, '2022', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('222222245', 'Shreyas', NULL, 'Chandrakantha', NULL, NULL, NULL, '2022', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('222222246', 'Qusay', NULL, 'Razzaq', NULL, NULL, NULL, '2022', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('222222247', 'Nishant', NULL, 'Sachdeva', NULL, NULL, NULL, '2022', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('222222248', 'Ayush', NULL, 'Sinha', NULL, NULL, NULL, '2022', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('222222249', 'Aravind', NULL, 'Srinivasan', NULL, NULL, NULL, '2022', 'Fall', '2024', 'Spring' )
INSERT INTO [Smith_Ranking.Student] VALUES ('222222250', 'Michael', NULL, 'Wilgus', NULL, NULL, NULL, '2022', 'Fall', '2024', 'Spring' )

-- Inserting actual data for Smith Faculty members. Due to privacy reasons, actual facultyIds are unavailable. We have augmented facultyIds as the a primary key.

INSERT INTO [Smith_Ranking.Faculty] VALUES ( '800000001', 'Suresh', NULL, 'Acharya', NULL, 'Professor', 'suresh12@umd.edu' )
INSERT INTO [Smith_Ranking.Faculty] VALUES ( '800000002', 'Rajshree', NULL, 'Agarwal', NULL, 'Professor', 'rajshree@umd.edu' )
INSERT INTO [Smith_Ranking.Faculty] VALUES ( '800000003', 'Aysun', NULL, 'Alp Paukowits', NULL, 'Professor', 'alpaysun@umd.edu' )
INSERT INTO [Smith_Ranking.Faculty] VALUES ( '800000004', 'Oya', NULL, 'Altınkılıç', NULL, 'Professor', 'oya@rhsmith.umd.edu' )
INSERT INTO [Smith_Ranking.Faculty] VALUES ( '800000005', 'Tejwansh', NULL, '(Tej) Singh Anand', NULL, 'Professor', 'tejanand@umd.edu' )
INSERT INTO [Smith_Ranking.Faculty] VALUES ( '800000006', 'G.', NULL, '“Anand” Anandalingam', NULL, 'Professor', 'ganand@umd.edu' )
INSERT INTO [Smith_Ranking.Faculty] VALUES ( '800000007', 'T.', NULL, 'Leigh Anenson', NULL, 'Professor', 'lanenson@umd.edu' )
INSERT INTO [Smith_Ranking.Faculty] VALUES ( '800000008', 'Pamela', NULL, 'K. Armstrong', NULL, 'Professor', 'parmstr1@umd.edu' )
INSERT INTO [Smith_Ranking.Faculty] VALUES ( '800000009', 'Joseph', NULL, 'P. Bailey', NULL, 'Professor', 'jpbailey@umd.edu' )
INSERT INTO [Smith_Ranking.Faculty] VALUES ( '800000010', 'M.', NULL, 'Gisela Bardossy', NULL, 'Professor', 'bardossy@umd.edu' )
INSERT INTO [Smith_Ranking.Faculty] VALUES ( '800000011', 'Progyan', NULL, 'Basu', NULL, 'Professor', 'pbasu@umd.edu' )
INSERT INTO [Smith_Ranking.Faculty] VALUES ( '800000012', 'Margrét', NULL, 'Bjarnadóttir', NULL, 'Professor', 'mbjarnad@umd.edu' )
INSERT INTO [Smith_Ranking.Faculty] VALUES ( '800000013', 'John', NULL, 'Bono', NULL, 'Professor', 'jbono@umd.edu' )
INSERT INTO [Smith_Ranking.Faculty] VALUES ( '800000014', 'Henry', NULL, 'C. Boyd III', NULL, 'Professor', 'hboyd2@umd.edu' )
INSERT INTO [Smith_Ranking.Faculty] VALUES ( '800000015', 'Serguey', NULL, 'Braguinsky', NULL, 'Professor', 'sbrag@umd.edu' )
INSERT INTO [Smith_Ranking.Faculty] VALUES ( '800000016', 'Cecilia', NULL, 'Bustamante', NULL, 'Professor', 'mcbustam@umd.edu' )
INSERT INTO [Smith_Ranking.Faculty] VALUES ( '800000017', 'Eugene', NULL, 'H. Cantor', NULL, 'Professor', 'ecantor@umd.edu' )
INSERT INTO [Smith_Ranking.Faculty] VALUES ( '800000018', 'Sean', NULL, 'Cao', NULL, 'Professor', 'scao824@umd.edu' )
INSERT INTO [Smith_Ranking.Faculty] VALUES ( '800000019', 'Zhi-Long', NULL, 'Chen', NULL, 'Professor', 'zlchen@umd.edu' )
INSERT INTO [Smith_Ranking.Faculty] VALUES ( '800000020', 'Gilad', NULL, 'Chen', NULL, 'Professor', 'gchen3@umd.edu' )
INSERT INTO [Smith_Ranking.Faculty] VALUES ( '800000021', 'W.', NULL, 'Jason Choi', NULL, 'Professor', 'wjchoi@umd.edu' )
INSERT INTO [Smith_Ranking.Faculty] VALUES ( '800000022', 'Wilbur', NULL, 'Chung', NULL, 'Professor', 'wchung@umd.edu' )
INSERT INTO [Smith_Ranking.Faculty] VALUES ( '800000023', 'Michael', NULL, 'Cichello', NULL, 'Professor', 'mcichell@umd.edu' )
INSERT INTO [Smith_Ranking.Faculty] VALUES ( '800000024', 'Jessica', NULL, 'M. Clark', NULL, 'Professor', 'jmclark@umd.edu' )
INSERT INTO [Smith_Ranking.Faculty] VALUES ( '800000025', 'Nicole', NULL, 'M. Coomber', NULL, 'Professor', 'ncottre@umd.edu' )
INSERT INTO [Smith_Ranking.Faculty] VALUES ( '800000026', 'Humberto', NULL, 'C. Coronado', NULL, 'Professor', 'hcoronad@umd.edu' )
INSERT INTO [Smith_Ranking.Faculty] VALUES ( '800000027', 'Thomas', NULL, 'M. Corsi', NULL, 'Professor', 'tcorsi@umd.edu' )
INSERT INTO [Smith_Ranking.Faculty] VALUES ( '800000028', 'Jon', NULL, 'Crocker', NULL, 'Professor', 'jcrocker@umd.edu' )
INSERT INTO [Smith_Ranking.Faculty] VALUES ( '800000029', 'Protiti', NULL, 'Dastidar', NULL, 'Professor', 'pdastida@umd.edu' )
INSERT INTO [Smith_Ranking.Faculty] VALUES ( '800000030', 'Rellie', NULL, 'Derfler-Rozin', NULL, 'Professor', 'rellie@umd.edu' )
INSERT INTO [Smith_Ranking.Faculty] VALUES ( '800000031', 'Cristian', NULL, 'Dezső', NULL, 'Professor', 'cdezso@umd.edu' )
INSERT INTO [Smith_Ranking.Faculty] VALUES ( '800000032', 'Waverly', NULL, 'Ding', NULL, 'Professor', 'wding@umd.edu' )
INSERT INTO [Smith_Ranking.Faculty] VALUES ( '800000033', 'Martin', NULL, 'Dresner', NULL, 'Professor', 'mdresner@umd.edu' )
INSERT INTO [Smith_Ranking.Faculty] VALUES ( '800000034', 'Wedad', NULL, 'J. Elmaghraby', NULL, 'Professor', 'welmaghr@umd.edu' )
INSERT INTO [Smith_Ranking.Faculty] VALUES ( '800000035', 'Thomas', NULL, 'Ernst', NULL, 'Professor', 'ternst@umd.edu' )
INSERT INTO [Smith_Ranking.Faculty] VALUES ( '800000036', 'Alex', NULL, 'Estes', NULL, 'Professor', 'NULL' )
INSERT INTO [Smith_Ranking.Faculty] VALUES ( '800000037', 'Philip', NULL, 'T. Evers', NULL, 'Professor', 'pevers@umd.edu' )
INSERT INTO [Smith_Ranking.Faculty] VALUES ( '800000038', 'Ali', NULL, 'Faraji-Rad', NULL, 'Professor', 'afr@umd.edu' )
INSERT INTO [Smith_Ranking.Faculty] VALUES ( '800000039', 'Nima', NULL, 'Farshchi', NULL, 'Professor', 'farshchi@umd.edu' )
INSERT INTO [Smith_Ranking.Faculty] VALUES ( '800000040', 'Michael', NULL, 'Faulkender', NULL, 'Professor', 'mfaulken@umd.edu' )
INSERT INTO [Smith_Ranking.Faculty] VALUES ( '800000042', 'Rosellina', NULL, 'Ferraro', NULL, 'Professor', 'rferrar2@umd.edu' )
INSERT INTO [Smith_Ranking.Faculty] VALUES ( '800000043', 'Trevor', NULL, 'Foulk', NULL, 'Professor', 'tfoulk@umd.edu' )
INSERT INTO [Smith_Ranking.Faculty] VALUES ( '800000044', 'Judy', NULL, 'Frels', NULL, 'Professor', 'jfrels@umd.edu' )
INSERT INTO [Smith_Ranking.Faculty] VALUES ( '800000045', 'Michael', NULL, 'Fu', NULL, 'Professor', 'mfu@umd.edu' )
INSERT INTO [Smith_Ranking.Faculty] VALUES ( '800000046', 'Kenneth', NULL, 'Fuller', NULL, 'Professor', 'kfuller5@umd.edu' )
INSERT INTO [Smith_Ranking.Faculty] VALUES ( '800000047', 'Mary', NULL, 'Beth Furst', NULL, 'Professor', 'mbfurst@umd.edu' )
INSERT INTO [Smith_Ranking.Faculty] VALUES ( '800000048', 'Leland', NULL, 'L. Gardner', NULL, 'Professor', 'lgardne1@umd.edu' )
INSERT INTO [Smith_Ranking.Faculty] VALUES ( '800000049', 'David', NULL, 'Godes', NULL, 'Professor', 'dgodes@umd.edu' )
INSERT INTO [Smith_Ranking.Faculty] VALUES ( '800000050', 'Bruce', NULL, 'L. Golden', NULL, 'Professor', 'bgolden@umd.edu' )
INSERT INTO [Smith_Ranking.Faculty] VALUES ( '800000051', 'Brent', NULL, 'Goldfarb', NULL, 'Professor', 'brentg@umd.edu' )
INSERT INTO [Smith_Ranking.Faculty] VALUES ( '800000053', 'Lawrence', NULL, 'A. Gordon', NULL, 'Professor', 'lagordon@umd.edu' )
INSERT INTO [Smith_Ranking.Faculty] VALUES ( '800000054', 'Xiaojia', NULL, 'Guo', NULL, 'Professor', 'xjguo@umd.edu' )
INSERT INTO [Smith_Ranking.Faculty] VALUES ( '800000055', 'Anil', NULL, 'K. Gupta', NULL, 'Professor', 'agupta@umd.edu' )
INSERT INTO [Smith_Ranking.Faculty] VALUES ( '800000056', 'Brandon', NULL, 'Yueyang Han', NULL, 'Professor', 'yhan@rhsmith.umd.edu' )
INSERT INTO [Smith_Ranking.Faculty] VALUES ( '800000057', 'Samuel', NULL, 'Handwerger', NULL, 'Professor', 'shandwer@umd.edu' )
INSERT INTO [Smith_Ranking.Faculty] VALUES ( '800000058', 'Il-Horn', NULL, 'Hann', NULL, 'Professor', 'ihann@umd.edu' )
INSERT INTO [Smith_Ranking.Faculty] VALUES ( '800000059', 'Rebecca', NULL, 'Hann', NULL, 'Professor', 'rhann@umd.edu' )
INSERT INTO [Smith_Ranking.Faculty] VALUES ( '800000060', 'Mary', NULL, 'B. Harms', NULL, 'Professor', 'mharms@umd.edu' )
INSERT INTO [Smith_Ranking.Faculty] VALUES ( '800000061', 'Alex', NULL, 'Xi He', NULL, 'Professor', 'ahe@rhsmith.umd.edu' )
INSERT INTO [Smith_Ranking.Faculty] VALUES ( '800000062', 'Steve', NULL, 'Heston', NULL, 'Professor', 'sheston@rhsmith.umd.edu' )
INSERT INTO [Smith_Ranking.Faculty] VALUES ( '800000064', 'Peng', NULL, 'Huang', NULL, 'Professor', 'huang@umd.edu' )
INSERT INTO [Smith_Ranking.Faculty] VALUES ( '800000065', 'Reuben', NULL, 'Hurst', NULL, 'Professor', 'whurst@umd.edu' )
INSERT INTO [Smith_Ranking.Faculty] VALUES ( '800000066', 'Agustin', NULL, 'Hurtado', NULL, 'Professor', 'hurtado@umd.edu' )
INSERT INTO [Smith_Ranking.Faculty] VALUES ( '800000067', 'Hassan', NULL, 'Ibrahim', NULL, 'Professor', 'hibrahim@umd.edu' )
INSERT INTO [Smith_Ranking.Faculty] VALUES ( '800000068', 'Bruno', NULL, 'Jacobs ', NULL, 'Professor', 'jacobs88@umd.edu' )
INSERT INTO [Smith_Ranking.Faculty] VALUES ( '800000069', 'Eaman', NULL, 'Jahani', NULL, 'Professor', 'NULL' )
INSERT INTO [Smith_Ranking.Faculty] VALUES ( '800000070', 'Apoorva', NULL, 'Javadekar', NULL, 'Professor', 'yjoshi@umd.edu' )
INSERT INTO [Smith_Ranking.Faculty] VALUES ( '800000071', 'Yogesh', NULL, 'Joshi', NULL, 'Professor', 'akabra@umd.edu' )
INSERT INTO [Smith_Ranking.Faculty] VALUES ( '800000072', 'Ashish', NULL, 'Kabra', NULL, 'Professor', 'pkannan@umd.edu' )
INSERT INTO [Smith_Ranking.Faculty] VALUES ( '800000075', 'Zeinab', NULL, 'Karake', NULL, 'Professor', 'zkarake@umd.edu' )
INSERT INTO [Smith_Ranking.Faculty] VALUES ( '800000076', 'David', NULL, 'Kass', NULL, 'Professor', 'dkass@rhsmith.umd.edu' )
INSERT INTO [Smith_Ranking.Faculty] VALUES ( '800000077', 'Mary', NULL, 'Keim', NULL, 'Professor', 'mkeim@umd.edu' )
INSERT INTO [Smith_Ranking.Faculty] VALUES ( '800000078', 'Sujin', NULL, 'Kim', NULL, 'Professor', 'kimsj22@umd.edu' )
INSERT INTO [Smith_Ranking.Faculty] VALUES ( '800000079', 'Michael', NULL, 'Kimbrough', NULL, 'Professor', 'mkimbrou@umd.edu' )
INSERT INTO [Smith_Ranking.Faculty] VALUES ( '800000080', 'Amna', NULL, 'Kirmani', NULL, 'Professor', 'akirmani@umd.edu' )
INSERT INTO [Smith_Ranking.Faculty] VALUES ( '800000081', 'David', NULL, 'A. Kirsch', NULL, 'Professor', 'dkirsch@umd.edu' )
INSERT INTO [Smith_Ranking.Faculty] VALUES ( '800000082', 'Elinda', NULL, 'F. Kiss', NULL, 'Professor', 'ekiss@umd.edu' )
INSERT INTO [Smith_Ranking.Faculty] VALUES ( '800000083', 'Prabhudev', NULL, 'Konana', NULL, 'Professor', 'smithdean@umd.edu' )
INSERT INTO [Smith_Ranking.Faculty] VALUES ( '800000084', 'Serhiy', NULL, 'Kozak', NULL, 'Professor', 'skozak@rhsmith.umd.edu' )
INSERT INTO [Smith_Ranking.Faculty] VALUES ( '800000086', '', NULL, '', NULL, 'Professor', 'skroncke@rhsmith.umd.edu' )
INSERT INTO [Smith_Ranking.Faculty] VALUES ( '800000087', '', NULL, '', NULL, 'Professor', 'akyle@rhsmith.umd.edu' )
INSERT INTO [Smith_Ranking.Faculty] VALUES ( '800000088', '', NULL, '', NULL, 'Professor', 'glanga@umd.edu' )
INSERT INTO [Smith_Ranking.Faculty] VALUES ( '800000089', '', NULL, '', NULL, 'Professor', 'rlazar@umd.edu' )
INSERT INTO [Smith_Ranking.Faculty] VALUES ( '800000090', '', NULL, '', NULL, 'Professor', 'rlefkoff@umd.edu' )
INSERT INTO [Smith_Ranking.Faculty] VALUES ( '800000091', '', NULL, '', NULL, 'Professor', 'hliao@umd.edu' )
INSERT INTO [Smith_Ranking.Faculty] VALUES ( '800000092', '', NULL, '', NULL, 'Professor', 'mploeb@umd.edu' )
INSERT INTO [Smith_Ranking.Faculty] VALUES ( '800000093', '', NULL, '', NULL, 'Professor', 'mloewens@rhsmith.umd.edu' )

--Program Data

INSERT INTO [Smith_Ranking.Program] VALUES
('MSIS', 'Information Systems', 'MS', 'Full Time', 93, 85666, 16, 30, 3.5, 9)

INSERT INTO [Smith_Ranking.Program] VALUES
('MSBA', 'Business Analytics', 'MS', 'Full Time', 96, 71389, 36, 30, 3.3, 12) 

INSERT INTO [Smith_Ranking.Program] VALUES
('MSMA', 'Marketing Analytics', 'MS', 'Full Time', 82, 87953, 19, 30, NULL, 8) 

INSERT INTO [Smith_Ranking.Program] VALUES
('MSAC', 'Accounting', 'MS', 'Full Time', 100, 63229, NULL, 30, NULL, 17)

INSERT INTO [Smith_Ranking.Program] VALUES
('MSFN', 'Finance', 'MS', 'Full Time', 74, 74285, 9, 30, 3.4, 13) 

INSERT INTO [Smith_Ranking.Program] VALUES
('MSCM', 'Supply Chain Mgmt', 'MS', 'Full Time', 90, 59789, 28, 30, 3.3, 10)

INSERT INTO [Smith_Ranking.Program] VALUES
('MSQF', 'Quantitative Finance', 'MS', 'Full Time', NULL, 90987, NULL, 36, NULL, 11)

INSERT INTO [Smith_Ranking.Program] VALUES
('MSMS', 'Management Studies', 'MS', 'Full Time', 91, NULL, NULL, 30, NULL, 9)

INSERT INTO [Smith_Ranking.Program] VALUES
('BUSM', 'Business Administration', 'MS', 'Full Time', NULL, 115385, NULL, 52, NULL, NULL)

-- Actual source Information

INSERT INTO [Smith_Ranking.Source] VALUES
('1', 'U.S. News', 'International')

INSERT INTO [Smith_Ranking.Source] VALUES
('2', 'QS World', 'International')


-- Year Information

INSERT INTO [Smith_Ranking.Year] VALUES
('2021')

INSERT INTO [Smith_Ranking.Year] VALUES
('2022')

INSERT INTO [Smith_Ranking.Year] VALUES
('2023')


--Enrollment Data
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111111', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111112', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111113', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111114', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111115', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111116', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111117', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111118', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111119', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111120', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111121', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111122', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111123', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111124', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111125', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111126', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111127', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111128', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111129', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111130', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111131', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111132', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111133', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111134', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111135', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111136', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111137', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111138', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111139', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111140', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111141', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111142', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111143', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111144', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111145', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111146', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111147', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111148', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111149', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111150', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111151', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111152', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111153', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111154', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111155', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111156', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111157', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111158', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111159', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111160', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111161', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111162', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111163', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111164', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111165', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111166', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111167', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111168', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111169', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111170', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111171', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111172', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111173', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111174', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111175', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111176', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111177', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111178', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111179', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111180', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111181', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111182', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111183', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111184', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111185', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111186', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111187', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111188', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111189', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111190', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111191', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111192', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111193', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111194', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111196', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111197', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111198', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111199', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111200', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111201', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111202', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111203', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111204', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111205', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111206', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111208', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111209', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111210', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111211', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111212', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111213', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111214', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111215', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111216', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111217', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111218', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111219', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111220', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111221', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111222', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111223', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111224', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111225', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111226', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111227', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111228', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111229', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111230', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111231', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111232', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111233', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111234', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111235', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111236', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111237', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111238', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111239', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111240', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111241', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111242', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111243', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111244', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111245', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111246', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111247', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111248', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111249', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111250', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111251', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111252', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111253', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111254', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111255', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111256', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111257', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111258', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111259', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111260', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111261', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111262', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111263', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111264', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111265', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111266', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111267', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111268', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111269', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111270', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111271', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111272', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111273', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111274', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111275', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111276', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111277', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111278', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111279', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('111111280', 'MSIS', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('222222220', 'BUSM', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('222222221', 'BUSM', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('222222222', 'BUSM', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('222222223', 'BUSM', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('222222224', 'BUSM', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('222222225', 'BUSM', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('222222226', 'BUSM', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('222222227', 'BUSM', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('222222228', 'BUSM', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('222222229', 'BUSM', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('222222230', 'BUSM', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('222222231', 'BUSM', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('222222232', 'BUSM', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('222222233', 'BUSM', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('222222234', 'BUSM', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('222222235', 'BUSM', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('222222236', 'BUSM', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('222222237', 'BUSM', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('222222238', 'BUSM', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('222222239', 'BUSM', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('222222240', 'BUSM', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('222222241', 'BUSM', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('222222242', 'BUSM', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('222222243', 'BUSM', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('222222244', 'BUSM', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('222222245', 'BUSM', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('222222246', 'BUSM', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('222222247', 'BUSM', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('222222248', 'BUSM', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('222222249', 'BUSM', NULL)
INSERT INTO [Smith_Ranking.Enroll] VALUES  ('222222250', 'BUSM', NULL)

-- Inserting Employment Data for known faculty in the MSIS and MSBA programs
INSERT INTO [Smith_Ranking.Employ] VALUES -- For Acharia
('800000001', 'MSBA')
INSERT INTO [Smith_Ranking.Employ] VALUES -- For John Bono
('800000013', 'MSIS')
INSERT INTO [Smith_Ranking.Employ] VALUES -- For Adam Lee
('800000088', 'MSIS')
INSERT INTO [Smith_Ranking.Employ] VALUES -- For Tej Anand
('800000005', 'MSIS')
INSERT INTO [Smith_Ranking.Employ] VALUES -- For Sujin Kim
('800000078', 'MSIS')

-- Students of Adam Lee
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111111' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111112' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111113' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111114' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111115' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111116' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111117' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111118' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111119' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111120' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111121' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111122' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111123' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111124' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111125' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111126' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111127' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111128' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111129' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111130' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111131' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111132' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111133' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111134' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111135' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111136' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111137' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111138' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111139' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111140' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111141' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111142' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111143' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111144' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111145' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111146' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111147' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111148' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111149' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111150' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111151' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111152' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111153' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111154' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111155' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111156' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111157' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111158' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111159' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111160' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111161' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111162' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111163' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111164' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111165' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111166' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111167' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111168' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111169' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111170' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111171' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111172' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111173' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111174' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111175' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111176' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111177' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111178' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111179' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111180' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111181' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111182' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111183' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111184' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111185' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111186' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111187' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111188' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111189' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111190' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111191' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111192' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111193' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111194' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111196' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111197' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111198' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111199' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111200' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111201' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111202' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111203' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111204' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111205' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111206' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111208' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111209' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111210' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111211' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111212' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111213' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111214' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111215' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111216' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111217' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111218' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111219' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111220' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111221' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111222' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111223' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111224' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111225' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111226' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111227' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111228' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111229' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111230' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111231' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111232' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111233' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111234' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111235' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111236' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111237' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111238' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111239' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111240' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111241' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111242' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111243' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111244' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111245' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111246' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111247' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111248' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111249' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111250' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111251' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111252' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111253' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111254' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111255' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111256' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111257' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111258' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111259' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111260' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111261' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111262' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111263' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111264' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111265' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111266' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111267' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111268' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111269' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111270' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111271' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111272' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111273' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111274' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111275' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111276' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111277' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111278' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111279' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000088', '111111280' )


-- Students of John Bono

INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111111' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111112' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111113' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111114' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111115' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111116' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111117' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111118' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111119' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111120' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111121' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111122' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111123' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111124' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111125' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111126' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111127' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111128' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111129' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111130' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111131' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111132' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111133' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111134' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111135' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111136' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111137' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111138' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111139' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111140' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111141' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111142' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111143' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111144' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111145' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111146' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111147' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111148' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111149' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111150' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111151' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111152' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111153' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111154' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111155' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111156' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111157' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111158' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111159' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111160' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111161' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111162' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111163' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111164' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111165' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111166' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111167' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111168' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111169' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111170' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111171' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111172' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111173' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111174' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111175' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111176' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111177' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111178' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111179' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111180' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111181' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111182' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111183' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111184' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111185' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111186' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111187' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111188' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111189' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111190' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111191' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111192' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111193' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111194' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111196' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111197' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111198' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111199' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111200' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111201' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111202' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111203' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111204' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111205' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111206' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111208' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111209' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111210' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111211' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111212' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111213' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111214' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111215' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111216' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111217' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111218' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111219' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111220' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111221' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111222' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111223' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111224' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111225' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111226' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111227' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111228' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111229' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111230' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111231' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111232' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111233' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111234' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111235' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111236' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111237' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111238' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111239' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111240' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111241' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111242' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111243' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111244' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111245' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111246' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111247' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111248' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111249' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111250' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111251' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111252' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111253' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111254' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111255' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111256' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111257' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111258' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111259' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111260' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111261' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111262' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111263' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111264' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111265' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111266' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111267' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111268' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111269' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111270' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111271' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111272' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111273' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111274' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111275' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111276' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111277' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111278' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111279' )
INSERT INTO [Smith_Ranking.Teach] VALUES ('800000013', '111111280' )

-- Ranking data from QS World for Masters Programs
-- MSCM

INSERT INTO [Smith_Ranking.Rate] VALUES -- QS World
('MSCM', '2', '2021', 24)

INSERT INTO [Smith_Ranking.Rate] VALUES -- QS World
('MSCM', '2', '2022', 26)

INSERT INTO [Smith_Ranking.Rate] VALUES -- QS World
('MSCM', '2', '2023', 28)

-- MSBA

INSERT INTO [Smith_Ranking.Rate] VALUES -- QS World
('MSBA', '2', '2022', 31)

INSERT INTO [Smith_Ranking.Rate] VALUES -- QS World
('MSBA', '2', '2021', 25)

INSERT INTO [Smith_Ranking.Rate] VALUES -- QS World
('MSBA', '2', '2023', 38)

-- MSMA

INSERT INTO [Smith_Ranking.Rate] VALUES -- QS World
('MSMA', '2', '2021', 34)

INSERT INTO [Smith_Ranking.Rate] VALUES -- QS World
('MSMA', '2', '2022', 37)

INSERT INTO [Smith_Ranking.Rate] VALUES -- QS World
('MSMA', '2', '2023', 39)

-- MSFN

INSERT INTO [Smith_Ranking.Rate] VALUES -- QS World
('MSFN', '2', '2021', 41)

INSERT INTO [Smith_Ranking.Rate] VALUES -- QS World
('MSFN', '2', '2022', 44)

INSERT INTO [Smith_Ranking.Rate] VALUES -- QS World
('MSFN', '2', '2023', 44)

-- Rankings from US News for Masters Programs

-- MSIS

INSERT INTO [Smith_Ranking.Rate] VALUES -- US News
('MSIS', '1', '2021', 5)

INSERT INTO [Smith_Ranking.Rate] VALUES -- US News
('MSIS', '1', '2022', 9)

INSERT INTO [Smith_Ranking.Rate] VALUES -- US News
('MSIS', '1', '2023', 16)


-- MSCM

INSERT INTO [Smith_Ranking.Rate] VALUES -- US News
('MSCM', '1', '2021', NULL)

INSERT INTO [Smith_Ranking.Rate] VALUES -- US News
('MSCM', '1', '2022', 18)

INSERT INTO [Smith_Ranking.Rate] VALUES -- US News
('MSCM', '1', '2023', NULL)

-- MSAC

INSERT INTO [Smith_Ranking.Rate] VALUES -- US News
('MSAC', '1', '2021', NULL)

INSERT INTO [Smith_Ranking.Rate] VALUES -- US News
('MSAC', '1', '2022', 24)

INSERT INTO [Smith_Ranking.Rate] VALUES -- US News
('MSAC', '1', '2023', NULL)


-- What are the rankings of Smith school programs by U.S. News and QS World in 2023?
SELECT r.ranking AS 'Ranking', p.prName AS 'Program', s.souName AS 'Source', YEAR(r.rankYear) AS 'Year'
FROM [Smith_Ranking.Program] p JOIN [Smith_Ranking.Rate] r 
ON p.prId = r.prId JOIN [Smith_Ranking.Source] s 
ON s.souId = r.souId 
WHERE r.ranking IS NOT NULL 
	AND r.rankYear = '2023'
ORDER BY r.rankYear ASC, r.ranking ASC, p.prName ;


-- What were the number of faculty for programs ranked by QS World in 2023 and their respective rankings? 
SELECT p.prName AS 'Program', p.prNumOfFaculty AS 'Number of Faculty', r.ranking AS 'Ranking'
FROM [Smith_Ranking.Program] p, [Smith_Ranking.Rate] r
WHERE r.souId = '2'
	AND p.prId = r.prId
	AND r.rankYear = '2023'
ORDER BY r.ranking, p.prNumofFaculty ;

-- What is the trend of Smith school program rankings issued by QS World between 2021-2023?
SELECT p.prName AS 'Program', YEAR(r.rankYear) AS 'Year', r.ranking AS 'Ranking'
FROM [Smith_Ranking.Program] p JOIN [Smith_Ranking.Rate] r
ON p.prId = r.prId 
WHERE r.souId = '2'
ORDER BY p.prName, r.rankYear ASC, r.ranking ASC ;

-- What are the average starting salaries and their average rankings issued between 2021-2023 of Smith school programs?
SELECT p.prName AS 'Program', AVG(p.prAvgStartSalary) AS 'Average Starting Salary', AVG(r.ranking) AS 'Average Ranking', s.souName AS 'Source'
FROM [Smith_Ranking.Program] p JOIN [Smith_Ranking.Rate] r
ON p.prId = r.prId JOIN [Smith_Ranking.Source] s 
ON r.souId = s.souId
GROUP BY p.prName, s.souName
ORDER BY AVG(r.ranking) ASC, AVG(p.prAvgStartSalary) DESC ;

-- What are the employment rates six months post-graduation for Smith programs ranked by by QS World in 2021?
SELECT p.prName AS 'Program Name', p.prEmpRate AS 'Employment Rate', r.ranking AS 'Rank', YEAR(r.rankYear) AS 'Year'
FROM [Smith_Ranking.Program] p JOIN [Smith_Ranking.Rate] r
ON p.prId = r.prId
WHERE r.souId = '2'
	AND r.rankYear = '2021'
ORDER BY r.ranking, p.prEmpRate DESC ;

-- What are the average GPAs and rankings of Smith programs by QS World in 2023?
SELECT (p.prName) AS 'Program Name', p.prAvgGPA AS 'Average GPA', r.ranking AS 'Rank', YEAR(r.rankYear) AS 'Year'
FROM [Smith_Ranking.Program] p JOIN [Smith_Ranking.Rate] r
ON p.prId = r.prId 
WHERE p.prAvgGPA IS NOT NULL
	AND r.rankYear = '2023'
	AND r.souId = '2'
ORDER BY p.prAvgGPA, r.ranking ;





