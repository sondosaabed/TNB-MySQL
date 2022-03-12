use bank;

#This query displays date of birth, name of Emploees whose name begin with E and at least 3 characters long
SELECT C.customer_DOB , C.customer_name
FROM customer C
where C.customer_name like 'E_%';

#This query counts number of accounts opened in Ramallah 
SELECT COUNT(A.city_name) As Cust_Count
FROM address A,Customer C
WHERE C.address_ID=A.address_id And A.city_name='Ramallah';

#This query diplays number of customer’s from Ramallah the count اhas an alias name of city
Select count(A.city_name) as Ramallah
From accounts C,branch B,address A
where C.branch_ID = B.Branch_ID AND 
B.address_ID= A.address_id AND 
city_name='Ramallah';

#This query display account id, customer’s id, customer’s name ,account activation date.
SELECT accounts.account_id, customer.customer_id, customer.customer_name, accounts.Activation_Date
FROM accounts
INNER JOIN customer 
ON accounts.customer_id = customer.customer_id;

#This query diplays maximum and minimum age of Custome 
SELECT MIN(S.customer_DOB) as min
FROM Customer S;

SELECT Max(S.customer_DOB) as max
FROM Customer S;

#This query display the customer’s number, customer’s name branch id and loan amount for people who have taken loans.
SELECT customer.customer_id, customer.customer_name, branch.Branch_ID, loan.Loan_amount
FROM (
		(loan INNER JOIN customer 
			ON loan.customer_id=customer.customer_id
		)
		INNER JOIN branch
			ON loan.Branch_ID=branch.Branch_ID
	);

#This query display the female customers name, city and account number who are not into studies loan.
SELECT DISTINCT customer.customer_name,accounts.account_id,loan.Loan_type
FROM accounts, customer , loan 
WHERE accounts.customer_id = customer.customer_id
AND customer.customer_id=loan.customer_id 
And  customer.customer_Gender='Female'
AND NOT(Loan_type='Student Loan');

#This query display the customer number, name, customer’s date of birth. Sorted order of date of birth year and within that sort by firstname.
SELECT customer_id, customer_name,customer_DOB 
FROM customer 
ORDER BY EXTRACT(year FROM customer_DOB), customer_name ASC;

#This query display  the customer number, customer firstname,account number for the customer’s whose accounts were created after 15th of any month.
SELECT accounts.customer_id, customer.customer_name, accounts.account_id
FROM accounts, customer
WHERE accounts.customer_id = customer.customer_id
AND day(customer_DOB) > 15;
