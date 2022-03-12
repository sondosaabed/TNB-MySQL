use bank;

Alter table customer_employee drop foreign key customer_employee_ibfk_1;
alter table customer_employee add foreign key (employee_ID) references employee(employee_ID) on DELETE CASCADE;

Alter table customer_employee drop foreign key customer_employee_ibfk_2;
alter table customer_employee add foreign key (customer_id) references customer(customer_id) on DELETE CASCADE;

Alter table transactions drop foreign key transactions_ibfk_1;
alter table transactions add foreign key (employee_ID) references employee(employee_ID) on DELETE CASCADE;

Alter table transactions drop foreign key transactions_ibfk_2;
alter table transactions add foreign key (customer_id) references customer(customer_id) on DELETE CASCADE;

Alter table transactions_accounts drop foreign key transactions_accounts_ibfk_2;
alter table transactions_accounts add foreign key (Transaction_ID) references transactions(Transaction_ID) on DELETE CASCADE;

Alter table transactions_accounts drop foreign key transactions_accounts_ibfk_1;
alter table transactions_accounts add foreign key (account_id) references accounts(account_id) on DELETE CASCADE;

Alter table payment drop foreign key payment_ibfk_1;
alter table payment add foreign key (Loan_number) references loan(Loan_number) on DELETE CASCADE;

Alter table accounts drop foreign key accounts_ibfk_1;
alter table accounts add foreign key (Branch_ID) references branch(Branch_ID) on DELETE CASCADE;

Alter table accounts drop foreign key accounts_ibfk_2;
alter table accounts add foreign key (customer_id) references customer(customer_id) on DELETE CASCADE;

Alter table branch drop foreign key branch_ibfk_1;
alter table branch add foreign key (Bank_ID) references bank(Bank_ID) on DELETE CASCADE;

Alter table branch drop foreign key branch_ibfk_2;
alter table branch add foreign key (Branch_phone) references phone(phone_number) on DELETE CASCADE;

Alter table branch drop foreign key branch_ibfk_3;
alter table branch add foreign key (address_ID) references address(address_id) on DELETE CASCADE;

Alter table customer drop foreign key customer_ibfk_1;
alter table customer add foreign key (address_ID) references address(address_id) on DELETE CASCADE;

Alter table customer drop foreign key customer_ibfk_2;
alter table customer add foreign key (customer_phone) references phone(phone_number) on DELETE CASCADE;

Alter table department drop foreign key department_ibfk_1;
alter table department add foreign key (Branch_ID) references branch(Branch_ID) on DELETE CASCADE;

Alter table department drop foreign key department_ibfk_2;
alter table department add foreign key (Manager_ID) references manager(Manager_ID) on DELETE CASCADE;

Alter table department drop foreign key department_ibfk_3;
alter table department add foreign key (Department_phone) references phone(phone_number) on DELETE CASCADE;

Alter table employee drop foreign key employee_ibfk_1;
alter table employee add foreign key (Department_ID) references department(department_ID) on DELETE CASCADE;

Alter table employee drop foreign key employee_ibfk_2;
alter table employee add foreign key (address_ID) references address(address_id) on DELETE CASCADE;

Alter table employee drop foreign key employee_ibfk_3;
alter table employee add foreign key (employee_phone) references phone(phone_number) on DELETE CASCADE;

Alter table loan drop foreign key loan_ibfk_1;
alter table loan add foreign key (Branch_ID) references branch(Branch_ID) on DELETE CASCADE;

Alter table loan drop foreign key loan_ibfk_2;
alter table loan add foreign key (customer_id) references customer(customer_id) on DELETE CASCADE;

Alter table manager drop foreign key manager_ibfk_1;
alter table manager add foreign key (address_ID) references address(address_id) on DELETE CASCADE;

Alter table manager drop foreign key manager_ibfk_2;
alter table manager add foreign key (Manager_phone) references phone(phone_number) on DELETE CASCADE;