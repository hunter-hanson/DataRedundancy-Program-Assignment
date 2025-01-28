-- Create WorkStudyEmployees table
CREATE TABLE WorkStudyEmployees (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(50) NOT NULL,
    Address VARCHAR(100) NOT NULL,
    City VARCHAR(50) NOT NULL,
    State CHAR(2) NOT NULL,
    ZipCode CHAR(5) NOT NULL
);

-- Create WorkStudyLevels table
CREATE TABLE WorkStudyLevels (
    LevelID VARCHAR(10) PRIMARY KEY,
    HourlyRate DECIMAL(5,2) NOT NULL
);

-- Create Tasks table
CREATE TABLE Tasks (
    TaskID INT PRIMARY KEY AUTO_INCREMENT,
    TaskName VARCHAR(50) NOT NULL
);

-- Create WorkAssignments table
CREATE TABLE WorkAssignments (
    AssignmentID INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeID INT,
    LevelID VARCHAR(10),
    TaskID INT,
    TaskHours DECIMAL(4,1) NOT NULL,
    FOREIGN KEY (EmployeeID) REFERENCES WorkStudyEmployees(EmployeeID),
    FOREIGN KEY (LevelID) REFERENCES WorkStudyLevels(LevelID),
    FOREIGN KEY (TaskID) REFERENCES Tasks(TaskID)
);

-- Insert data into WorkStudyEmployees table
INSERT INTO WorkStudyEmployees (Name, Address, City, State, ZipCode) VALUES
('Tom Jones', '234 Main St.', 'Mankato', 'MN', '56001'),
('Bill Brown', '843 Elm St.', 'North Mankato', 'MN', '56003'),
('Lisa Evans', '55 First Ave.', 'Mankato', 'MN', '56001'),
('Nancy Williams', '399 Broad St.', 'Mankato', 'MN', '56001');

-- Insert data into WorkStudyLevels table
INSERT INTO WorkStudyLevels (LevelID, HourlyRate) VALUES
('L1', 8.00),
('L2', 8.50),
('L3', 9.00),
('Supervisor', 10.00);

-- Insert data into Tasks table
INSERT INTO Tasks (TaskName) VALUES
('Lab Setup'),
('Network Studio'),
('Install Software');

-- Insert data into WorkAssignments table
INSERT INTO WorkAssignments (EmployeeID, LevelID, TaskID, TaskHours) VALUES
((SELECT EmployeeID FROM WorkStudyEmployees WHERE Name = 'Tom Jones'), 'L1', (SELECT TaskID FROM Tasks WHERE TaskName = 'Lab Setup'), 4.2),
((SELECT EmployeeID FROM WorkStudyEmployees WHERE Name = 'Bill Brown'), 'L2', (SELECT TaskID FROM Tasks WHERE TaskName = 'Network Studio'), 2.0),
((SELECT EmployeeID FROM WorkStudyEmployees WHERE Name = 'Lisa Evans'), 'L3', (SELECT TaskID FROM Tasks WHERE TaskName = 'Install Software'), 3.5),
((SELECT EmployeeID FROM WorkStudyEmployees WHERE Name = 'Nancy Williams'), 'Supervisor', (SELECT TaskID FROM Tasks WHERE TaskName = 'Lab Setup'), 1.0),
((SELECT EmployeeID FROM WorkStudyEmployees WHERE Name = 'Tom Jones'), 'L2', (SELECT TaskID FROM Tasks WHERE TaskName = 'Lab Setup'), 4.5),
((SELECT EmployeeID FROM WorkStudyEmployees WHERE Name = 'Tom Jones'), 'L3', (SELECT TaskID FROM Tasks WHERE TaskName = 'Install Software'), 2.0),
((SELECT EmployeeID FROM WorkStudyEmployees WHERE Name = 'Bill Brown'), 'L1', (SELECT TaskID FROM Tasks WHERE TaskName = 'Lab Setup'), 4.0),
((SELECT EmployeeID FROM WorkStudyEmployees WHERE Name = 'Lisa Evans'), 'L3', (SELECT TaskID FROM Tasks WHERE TaskName = 'Network Studio'), 5.0),
((SELECT EmployeeID FROM WorkStudyEmployees WHERE Name = 'Tom Jones'), 'L2', (SELECT TaskID FROM Tasks WHERE TaskName = 'Network Studio'), 3.0),
((SELECT EmployeeID FROM WorkStudyEmployees WHERE Name = 'Bill Brown'), 'L3', (SELECT TaskID FROM Tasks WHERE TaskName = 'Install Software'), 2.5);
