CREATE TABLE employee (
  employee_id int(5) NOT NULL,
  gender varchar(1),
  f_name varchar(20),
  l_name varchar(20),
  address varchar(100),
  position varchar(20),
  PRIMARY KEY (employee_id)
);
 
CREATE TABLE clients (

  clients_id int(5) NOT NULL,
  gender varchar(1),
  f_name varchar(20),
  l_name varchar(20),
  address varchar(100),
  company varchar(20),
  PRIMARY KEY (employee_id)
);
 
CREATE TABLE software (
  software_id int(10) NOT NULL,
  name varchar(20),
  type varchar(20),
  year int(4),
  version char(10),
  PRIMARY KEY (software_id)
);
 
CREATE TABLE support_schedule (
  s_s varchar(20) NOT NULL,
  red_id int(5),
  black_id int(5),
  calendar char(20),
  PRIMARY KEY (s_s)
  FOREIGN KEY (red_id)
  FOREIGN KEY (black_id)
 
);
 
CREATE TABLE update_schedule (
  u_s int(5) NOT NULL,
  software_id int(10),
  equipment_id int(10),
  calendar char(20),
  PRIMARY KEY (employee_id)
  FOREIGN KEY (software_id)
  FOREIGN KEY (equipment_id)
 
);
 
CREATE TABLE hardware (
  equipment_id int(10) NOT NULL,
  name varchar(20),
  type varchar(20),
  year int(4),
  version char(10),
  PRIMARY KEY (equipment_id)
);
 
 
 
CREATE TABLE teams (
  team_name varchar(12) NOT NULL,
  foreign_id int(5),
  employee_id int(5),
  project_id int(12),
  current_id int(7),
  PRIMARY KEY (team_name)
  FOREIGN KEY (employee_id)
  FOREIGN KEY (project_id)
 
);
 
 
CREATE TABLE payroll(
  check_id int(12) NOT NULL,
  employee_id int(5),
  amount int(8),
  type_of_payment varchar(10),
  PRIMARY KEY (check_id)
  FOREIGN KEY (employee_id) 
);
 
CREATE TABLE payroll(
  check_id int(12) NOT NULL,
  employee_id int(5),
  amount int(8),
  type_of_payment varchar(10),
  PRIMARY KEY (check_id)
  FOREIGN KEY (employee_id) 
);
 
CREATE TABLE department(
  dept_id int(12) NOT NULL,
  team_name varchar(12),
  client_id int(5),
  location varchar(20),
  address varchar(100),
  project_id int(10),
  PRIMARY KEY (dept_id)
  FOREIGN KEY (project_id)
  FOREIGN KEY (team_name)
  FOREIGN KEY (client_id) 
);
 
 
 
 
 
CREATE TABLE project(
  project_id int(12) NOT NULL,
  team_name varchar(12),
  client_id int(5),
  PRIMARY KEY (project_id)
  FOREIGN KEY (team_name)
  FOREIGN KEY (client_id) 
);
 
CREATE TABLE expenses(
  red_id int(5) NOT NULL,
  paid  varchar(1),
  PRIMARY KEY (red_id)
  );
 
CREATE TABLE payments(
  black_id int(5) NOT NULL,
  client_id int(5),
  PRIMARY KEY (black_id)
  );
  
	ROP Trigger if exists addTeam; --example trigger to modify
	ROP Trigger if exists upDatePay; --example trigger to modify
	ROP Trigger if exists projectAssignment; --example trigger to modify
delimiter 
CREATE TRIGGER addTeam
BEFORE INSERT on employees
	For each row 
	BEGIN
		IF NEW.team < 0 --when employee entered, update team
			THEN
				SET NEW.team =0;
		ELSEIF NEW.team > 100 THEN
			SET New.team = new.team + 10;
		End if;
	end;
delimiter ;
--//second trigger 
delimiter 
CREATE TRIGGER upDatePay
BEFORE INSERT on payroll
	For each row 
	BEGIN
		IF NEW.payment < 0 
			THEN
				SET NEW.payment =0; //when payed set payment to zero 
		ELSEIF NEW.payment > 100 THEN
			SET New.payment = new.payment + 10;
		End if;
	end;//
delimiter ;
--3rd trigger
delimiter 
CREATE TRIGGER projectAssignment
BEFORE INSERT on project
	For each row 
	BEGIN
		IF NEW.project < 0 --//when in project is created, assign a team to it 
			THEN
				SET NEW.team =project;
		ELSEIF NEW.team > 100 THEN
			SET New.project = new.team + 10;
		End if;
	end;
delimiter ;



--queries

Select Address from Employees join clients on  clients.address;
Select TeamName from Department join Team on Team.projectID;
Select CheckId from Payroll join payments on payments.blackid;