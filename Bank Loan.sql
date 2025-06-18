SELECT * FROM Bank_Loan_DB

SELECT COUNT(id) AS Total_Loan_Application FROM Bank_Loan_DB

SELECT COUNT(id) AS Total_Loan_Application 
FROM Bank_Loan_DB
WHERE MONTH(issue_date) =  12 AND YEAR(issue_date) = 2021

SELECT COUNT(id) AS Total_Loan_Application 
FROM Bank_Loan_DB
WHERE MONTH(issue_date) = 11

SELECT SUM(loan_amount) AS Total_Funded_Amount 
FROM Bank_Loan_DB

SELECT SUM(loan_amount) AS Total_Funded_Amount 
FROM Bank_Loan_DB
WHERE MONTH(issue_date) =  12 

SELECT SUM(loan_amount) AS Total_Funded_Amount 
FROM Bank_Loan_DB
WHERE MONTH(issue_date) =  11

SELECT SUM(total_payment) AS Total_Amount_Received
FROM Bank_Loan_DB

SELECT SUM(total_payment) AS Total_Amount_Received
FROM Bank_Loan_DB
WHERE MONTH(issue_date) =  12 

SELECT SUM(total_payment) AS Total_Amount_Received
FROM Bank_Loan_DB
WHERE MONTH(issue_date) = 11

SELECT ROUND(AVG(int_rate),4) *100 AS Average_Interest_Rate
FROM Bank_Loan_DB

SELECT ROUND(AVG(int_rate),4) *100 AS Average_Interest_Rate
FROM Bank_Loan_DB
WHERE MONTH(issue_date) =  12

SELECT ROUND(AVG(int_rate),4) *100 AS Average_Interest_Rate
FROM Bank_Loan_DB
WHERE MONTH(issue_date) =  11

SELECT ROUND(AVG(dti),4) *100 AS Average_Debt_to_Income_Ratio
FROM Bank_Loan_DB

SELECT ROUND(AVG(dti),4) *100 AS Average_Debt_to_Income_Ratio
FROM Bank_Loan_DB
WHERE MONTH(issue_date) =  12

SELECT ROUND(AVG(dti),4) *100 AS Average_Debt_to_Income_Ratio
FROM Bank_Loan_DB
WHERE MONTH(issue_date) =  11

SELECT 
(COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END)*100)
/
COUNT(id) AS Good_Loan_Percentage
FROM Bank_Loan_DB

SELECT COUNT(id) AS Good_Loan_Applications FROM Bank_Loan_DB
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

SELECT SUM(loan_amount) AS Good_Loan_FundedAmount
FROM Bank_Loan_DB
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

SELECT SUM(total_payment) AS Good_Loan_Total_ReceivedAmount
FROM Bank_Loan_DB
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

SELECT
    (COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END) * 100.0) / 
	COUNT(id) AS Bad_Loan_Percentage
FROM Bank_Loan_DB

SELECT COUNT(id) AS Bad_Loan_Applications
FROM Bank_Loan_DB
WHERE loan_status = 'Charged Off'

SELECT SUM(loan_amount) AS Bad_Loan_FundedAmount
FROM Bank_Loan_DB
WHERE loan_status = 'Charged Off'

SELECT SUM(total_payment) AS Bad_Loan_Total_ReceivedAmount
FROM Bank_Loan_DB
WHERE loan_status = 'Charged Off'

SELECT loan_status,
COUNT(id) AS Total_Loan_Application,
SUM(loan_amount) AS Total_Funded_AmounT,
SUM(total_payment) AS Total_Amount_Received,
ROUND(AVG(int_rate),4) *100 AS Average_Interest_Rate,
ROUND(AVG(dti),4) *100 AS Average_Debt_to_Income_Ratio
FROM Bank_Loan_DB
GROUP BY loan_status

SELECT loan_status,
SUM(loan_amount) AS Total_Funded_AmounT,
SUM(total_payment) AS Total_Amount_Received
FROM Bank_Loan_DB
WHERE MONTH(issue_date) =  12
GROUP BY loan_status

SELECT MONTH(issue_date) AS Month_No,
DATENAME(MONTH, issue_date) AS Month_Name,
COUNT(id) AS Total_Loan_Application,
SUM(loan_amount) AS Total_Funded_AmounT,
SUM(total_payment) AS Total_Amount_Received
FROM Bank_Loan_DB
GROUP BY MONTH(issue_date), DATENAME(MONTH, issue_date)
ORDER BY MONTH(issue_date)

SELECT address_state AS Address,
COUNT(id) AS Total_Loan_Application,
SUM(loan_amount) AS Total_Funded_AmounT,
SUM(total_payment) AS Total_Amount_Received
FROM Bank_Loan_DB
GROUP BY address_state
ORDER BY address_state

SELECT term AS Term,
COUNT(id) AS Total_Loan_Application,
SUM(loan_amount) AS Total_Funded_AmounT,
SUM(total_payment) AS Total_Amount_Received
FROM Bank_Loan_DB
GROUP BY term
ORDER BY term

SELECT emp_length AS Employee_Lenght,
COUNT(id) AS Total_Loan_Application,
SUM(loan_amount) AS Total_Funded_AmounT,
SUM(total_payment) AS Total_Amount_Received
FROM Bank_Loan_DB
GROUP BY emp_length
ORDER BY emp_length

SELECT purpose AS Purpose,
COUNT(id) AS Total_Loan_Application,
SUM(loan_amount) AS Total_Funded_AmounT,
SUM(total_payment) AS Total_Amount_Received
FROM Bank_Loan_DB
GROUP BY purpose
ORDER BY purpose

SELECT home_ownership AS Home_Ownership,
COUNT(id) AS Total_Loan_Application,
SUM(loan_amount) AS Total_Funded_AmounT,
SUM(total_payment) AS Total_Amount_Received
FROM Bank_Loan_DB
GROUP BY home_ownership
ORDER BY home_ownership

