/* non_usa_customers.sql: 
	Provide a query showing Customers (just their full names, customer ID and country) who are not in the US. */

select FirstName, LastName, CustomerId, Country
from Customer
where Country = 'USA'

/* brazil_customers.sql: Provide a query only showing the Customers from Brazil. */

select *
from Customer
where Country = 'Brazil'

/* brazil_customers_invoices.sql: Provide a query showing the Invoices of customers who are from Brazil. 
	The resultant table should show the customer's full name, Invoice ID, Date of the invoice and billing country. */

select FirstName, LastName, InvoiceId, InvoiceDate, BillingCountry
from Invoice
join Customer
	on Invoice.CustomerId = Customer.CustomerId

/* sales_agents.sql: Provide a query showing only the Employees who are Sales Agents. */
select *
from Employee
where Title = 'Sales Support Agent'