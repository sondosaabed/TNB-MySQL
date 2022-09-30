#drop database bank;
create database bank;
use bank;

CREATE TABLE login(
		username varchar(255) DEFAULT NULL ,
		UNIQUE (username),
		passwd varchar(255) DEFAULT NULL ,
		user_ID int NOT NULL AUTO_INCREMENT,
		PRIMARY KEY (user_ID) ); 
				
CREATE TABLE bank(
             bank_name varchar(255) DEFAULT NULL,
             Bank_ID int NOT NULL AUTO_INCREMENT,
             PRIMARY KEY (Bank_ID)); 
             
CREATE TABLE address( 
             address_id int NOT NULL AUTO_INCREMENT,
             Postal_code int DEFAULT NULL,
             Street_name varchar(255) DEFAULT NULL,
             city_name varchar(255) DEFAULT NULL,
             PRIMARY KEY (address_id));
          
CREATE TABLE phone(
		     phone_number int NOT NULL,
             PRIMARY KEY (phone_number)); 
   
   create table customer ( 
                customer_id int primary key auto_increment,
				customer_name varchar(255), 
                customer_phone int,
                customer_DOB date , 
				customer_Gender varchar(32), 
				address_ID int,
				foreign key(address_ID) references Address(address_id),
                foreign key (customer_phone) references phone(phone_number)
                         );

CREATE TABLE branch(
			 Branch_ID int NOT NULL AUTO_INCREMENT,
			Branch_name varchar(255) DEFAULT NULL,
            Branch_Email varchar(255) DEFAULT NULL,
            Branch_Phone int DEFAULT NULL,
            Bank_ID int DEFAULT NULL,
            address_ID int DEFAULT NULL,
            PRIMARY KEY (Branch_ID),
            FOREIGN KEY (Bank_ID) REFERENCES bank (Bank_ID),
            FOREIGN KEY (Branch_Phone) REFERENCES phone (phone_number),
            FOREIGN KEY (address_ID) REFERENCES address (address_id));
            
CREATE TABLE accounts (
             account_id int NOT NULL AUTO_INCREMENT,
             customer_id int DEFAULT NULL,
			 Account_Type varchar(255) DEFAULT NULL,
             Registration_Date date DEFAULT NULL,
             Activation_Date date DEFAULT NULL,
			 branch_ID int DEFAULT NULL,
             Interest double DEFAULT NULL,
             initial_deposity double DEFAULT NULL,
             PRIMARY KEY (account_id),
             FOREIGN KEY (branch_ID) REFERENCES branch (Branch_ID),
			 FOREIGN KEY (customer_id) REFERENCES customer (customer_id));
             

                       
CREATE TABLE card(
             card_ID int NOT NULL AUTO_INCREMENT,
             card_limit double DEFAULT NULL,
             card_exp_date date DEFAULT NULL,
             customer_id int DEFAULT NULL,
             PRIMARY KEY (card_ID),
             FOREIGN KEY (customer_id) REFERENCES customer (customer_id)); 
             
CREATE TABLE loan(
             Loan_number int NOT NULL AUTO_INCREMENT,
             Loan_amount double DEFAULT NULL,
             Loan_type varchar(255) DEFAULT NULL,
             Branch_ID int DEFAULT NULL,
             customer_id int DEFAULT NULL,
             loan_date date DEFAULT NULL,
             PRIMARY KEY (Loan_number),
             FOREIGN KEY (Branch_ID) REFERENCES branch (Branch_ID),
             FOREIGN KEY (customer_id) REFERENCES customer (customer_id)); 

CREATE TABLE manager(
             Manager_ID int NOT NULL AUTO_INCREMENT,
             Manage_name varchar(255) DEFAULT NULL,
             Manager_phone int DEFAULT NULL,
             Manager_BOB date DEFAULT NULL,
             Manager_Gender varchar(32) DEFAULT NULL,
             Manage_Email varchar(255) DEFAULT NULL,
             Manage_Salary double DEFAULT NULL,
             address_ID int DEFAULT NULL,
             PRIMARY KEY (Manager_ID),
             FOREIGN KEY (address_ID) REFERENCES address(address_id),
             FOREIGN KEY (Manager_phone) REFERENCES phone (phone_number));              
 
 CREATE TABLE department( 
             department_ID int NOT NULL AUTO_INCREMENT,
             Department_name varchar(255) DEFAULT NULL,
             Department_phone int DEFAULT NULL,
             Department_Email varchar(255) DEFAULT NULL,
             Branch_ID int DEFAULT NULL,
             Manager_ID int DEFAULT NULL,
             PRIMARY KEY (department_ID),
             FOREIGN KEY (Branch_ID) REFERENCES branch (Branch_ID),
             FOREIGN KEY (Manager_ID) REFERENCES manager(Manager_ID),
             FOREIGN KEY (Department_phone) REFERENCES phone(phone_number)); 

CREATE TABLE employee(
             employee_ID int NOT NULL AUTO_INCREMENT,
             employee_name varchar(255) DEFAULT NULL,
             employee_phone int DEFAULT NULL,
             employee_gender varchar(32) DEFAULT NULL,
             employee_DOB date DEFAULT NULL,
             employee_Email varchar(255) DEFAULT NULL,
             employee_Salary double DEFAULT NULL,
             Department_ID int DEFAULT NULL,
             address_ID int DEFAULT NULL,
             PRIMARY KEY (employee_ID),
             FOREIGN KEY (Department_ID) REFERENCES department(department_ID),
             FOREIGN KEY (address_ID) REFERENCES address(address_id),
             FOREIGN KEY (employee_phone) REFERENCES phone(phone_number));
             
CREATE TABLE customer_employee(
			 customer_id int NOT NULL auto_increment,
             employee_ID int NOT NULL,
             serves_name varchar(255) DEFAULT NULL,
		     PRIMARY KEY (customer_id,employee_ID),
             FOREIGN KEY (employee_ID) REFERENCES employee (employee_ID),
			 FOREIGN KEY (customer_id) REFERENCES customer (customer_id));  

CREATE TABLE payment(
             Payment_Number int NOT NULL AUTO_INCREMENT,
             Payment_amount double DEFAULT NULL,
             Payment_date date DEFAULT NULL,
             Loan_number int DEFAULT NULL,
             PRIMARY KEY (Payment_Number),
             FOREIGN KEY (Loan_number) REFERENCES loan (Loan_number)); 
             
CREATE TABLE transactions(
             Transaction_ID int NOT NULL AUTO_INCREMENT,
             Transposition_date date DEFAULT NULL,
             Transposition_type varchar(255) DEFAULT NULL,
             Transposition_amount int DEFAULT NULL,
             employee_ID int DEFAULT NULL,
             customer_id int DEFAULT NULL,
             PRIMARY KEY (Transaction_ID),
             FOREIGN KEY (employee_ID) REFERENCES employee (employee_ID),
             FOREIGN KEY (customer_id) REFERENCES customer (customer_id));
             
CREATE TABLE transactions_accounts(
             transactionPK int NOT NULL auto_increment,
             account_id int DEFAULT NULL,
             Transaction_ID int DEFAULT NULL,
             PRIMARY KEY (transactionPK),
             FOREIGN KEY (account_id) REFERENCES accounts(account_id),
             FOREIGN KEY (Transaction_ID) REFERENCES transactions (Transaction_ID)); 
		
