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

/* unique_invoice_countries.sql: 
	Provide a query showing a unique/distinct list of billing countries from the Invoice table. */

select distinct BillingCountry
from Invoice

/* sales_agent_invoices.sql: Provide a query that shows the invoices associated with each sales agent. 
	The resultant table should include the Sales Agent's full name. */

select 
	FullName = employee.FirstName + ' ' + employee.LastName,
	invoice.*
from customer
join employee 
	on employee.EmployeeId = customer.SupportRepId
join invoice
	on invoice.CustomerId = customer.CustomerId

/* invoice_totals.sql: 
	Provide a query that shows the Invoice Total, Customer name, Country and Sale Agent name for all invoices and customers. */
select 
	invoice.Total,
	CustomerName = customer.FirstName + ' ' + customer.LastName,
	customer.Country,
	SalesRep = employee.FirstName + ' ' + employee.LastName
from customer
join employee
	on customer.SupportRepId = employee.EmployeeId
join invoice
	on invoice.CustomerId = customer.CustomerId

/* total_invoices_{year}.sql: 
	How many Invoices were there in 2009 and 2011? */
select Invoices_in_2009_and_2011 = count(*)
from invoice
where InvoiceDate like '%2009%' or InvoiceDate like '%2011%'

/* total_sales_{year}.sql: 
	What are the respective total sales for each of those years? */

select 
	sum(Total) as Total,
	year(InvoiceDate) as Year
from invoice
where InvoiceDate like '%2009%' or InvoiceDate like '%2011%'
group by year(InvoiceDate)

/* invoice_37_line_item_count.sql: 
	Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for Invoice ID 37. */
select LineItems = Count(*)
from InvoiceLine
where InvoiceId = 37

/* line_items_per_invoice.sql: 
	Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for each Invoice. HINT: GROUP BY */

select LineItemsPerInvoice = count(*)
from InvoiceLine
group by InvoiceId

/* line_item_track.sql: Provide a query that includes the purchased track name with each invoice line item. */
select  
	i.InvoiceLineId,
	TrackName = Name
from InvoiceLine i
join Track t on i.TrackId = t.TrackId
