-- Q3
	SELECT 
		*
	FROM
		orders o 
		INNER JOIN customers cust
			ON cust.id = o.customer_id 
		INNER JOIN employees e 
			ON e.employee_id = o.employee_id 
		INNER JOIN shippers ship
			ON ship.id = o.shipper_id 
		INNER JOIN order_details od 
			ON o.id = od.order_id 
		INNER JOIN products p 
			ON od.product_id = p.id 
		INNER JOIN suppliers s 
			ON p.supplier_id = s.id 
		INNER JOIN categories c 
			ON p.category_id = c.id 
		
-- Q4a
	SELECT 
		count(*)
	FROM
		orders o 
		LEFT JOIN customers cust
			ON cust.id = o.customer_id 
		LEFT JOIN employees e 
			ON e.employee_id = o.employee_id 
		LEFT JOIN shippers ship
			ON ship.id = o.shipper_id 
		LEFT JOIN order_details od 
			ON o.id = od.order_id 
		LEFT JOIN products p 
			ON od.product_id = p.id 
		LEFT JOIN suppliers s 
			ON p.supplier_id = s.id 
		LEFT JOIN categories c 
			ON p.category_id = c.id 
			
/*
 * Total count = 518 rows
 * */
			
-- Q4b
	SELECT 
		count(*)
	FROM
		orders o 
		RIGHT JOIN customers cust
			ON cust.id = o.customer_id 
		LEFT JOIN employees e 
			ON e.employee_id = o.employee_id 
		LEFT JOIN shippers ship
			ON ship.id = o.shipper_id 
		LEFT JOIN order_details od 
			ON o.id = od.order_id 
		LEFT JOIN products p 
			ON od.product_id = p.id 
		LEFT JOIN suppliers s 
			ON p.supplier_id = s.id 
		LEFT JOIN categories c 
			ON p.category_id = c.id 
			
/*
 * The amount is at 518 when the join is inner join or left join as the total count of rows cannot be more than the total amount of rows in the orders table. 
 * However when we make changes to the joins we can adjust the join type to instead focus on the other table as inclusing all of its values.
 * This can be seen when we use a RIGHT JOIN on the customers table which results in there now being 535 total rows.
 * This shows us that there are most likely customers in the database that have not made a purchase.
 * However having two right joins, especially if the second value is smaller than the amount of customers in the first right join will cause the total amount to return to the baseline of 519.
 * Overall this showed that the use of inner join and left join, in majority ar similar while if there are multiple left and right joins, then the total amoint of values will be inside the maximums of the range.
 **/
			
-- Q4b
	WITH all_data AS (
		SELECT 
			o.id as order_id
			,customer_id
			,o.employee_id
			,date
			,shipper_id
			,cust.name as customer_name
			,cust.contact as customer_contact
			,cust.address as customer_address
			,cust.city
			,cust.postal_code
			,cust.country
			,last_name
			,first_name
			,birthdate
			,photo
			,notes
			,ship.name as shipper_name
			,ship.phone as shipper_phone
			,product_id
			,quantity
			,p.name as product_name
			,supplier_id
			,category_id
			,unit
			,price
			,s.name as supplier_name
			,s.contact as supplier_contact
			,s.address as supplier_address
			,s.city as supplier_city
			,s.postal_code as supplier_postal_code
			,s.country as supplier_country
			,s.phone as supplier_phone
			,c.name as category_name
			,description
		FROM
			orders o 
			RIGHT JOIN customers cust
				ON cust.id = o.customer_id 
			LEFT JOIN employees e 
				ON e.employee_id = o.employee_id 
			LEFT JOIN shippers ship
				ON ship.id = o.shipper_id 
			LEFT JOIN order_details od 
				ON o.id = od.order_id 
			LEFT JOIN products p 
				ON od.product_id = p.id 
			LEFT JOIN suppliers s 
				ON p.supplier_id = s.id 
			LEFT JOIN categories c 
				ON p.category_id = c.id
	)
	SELECT 
		*
	FROM
		all_data
	WHERE 
		employee_id BETWEEN 3 AND 11
		

-- 4d
WITH all_data AS (
		SELECT 
			o.id as order_id
			,customer_id
			,o.employee_id
			,date
			,shipper_id
			,cust.name as customer_name
			,cust.contact as customer_contact
			,cust.address as customer_address
			,cust.city
			,cust.postal_code
			,cust.country
			,last_name
			,first_name
			,birthdate
			,photo
			,notes
			,ship.name as shipper_name
			,ship.phone as shipper_phone
			,product_id
			,quantity
			,p.name as product_name
			,supplier_id
			,category_id
			,unit
			,price
			,s.name as supplier_name
			,s.contact as supplier_contact
			,s.address as supplier_address
			,s.city as supplier_city
			,s.postal_code as supplier_postal_code
			,s.country as supplier_country
			,s.phone as supplier_phone
			,c.name as category_name
			,description
		FROM
			orders o 
			RIGHT JOIN customers cust
				ON cust.id = o.customer_id 
			LEFT JOIN employees e 
				ON e.employee_id = o.employee_id 
			LEFT JOIN shippers ship
				ON ship.id = o.shipper_id 
			LEFT JOIN order_details od 
				ON o.id = od.order_id 
			LEFT JOIN products p 
				ON od.product_id = p.id 
			LEFT JOIN suppliers s 
				ON p.supplier_id = s.id 
			LEFT JOIN categories c 
				ON p.category_id = c.id
	)
	SELECT
		category_name
		,COUNT(*) as num_rows
		,ROUND(AVG(price), 2) as avg_price
		,ROUND(AVG(quantity), 0) as avg_quantity
	FROM
		all_data
	GROUP BY
		category_name
		
-- 4e
WITH all_data AS (
		SELECT 
			o.id as order_id
			,customer_id
			,o.employee_id
			,date
			,shipper_id
			,cust.name as customer_name
			,cust.contact as customer_contact
			,cust.address as customer_address
			,cust.city
			,cust.postal_code
			,cust.country
			,last_name
			,first_name
			,birthdate
			,photo
			,notes
			,ship.name as shipper_name
			,ship.phone as shipper_phone
			,product_id
			,quantity
			,p.name as product_name
			,supplier_id
			,category_id
			,unit
			,price
			,s.name as supplier_name
			,s.contact as supplier_contact
			,s.address as supplier_address
			,s.city as supplier_city
			,s.postal_code as supplier_postal_code
			,s.country as supplier_country
			,s.phone as supplier_phone
			,c.name as category_name
			,description
		FROM
			orders o 
			RIGHT JOIN customers cust
				ON cust.id = o.customer_id 
			LEFT JOIN employees e 
				ON e.employee_id = o.employee_id 
			LEFT JOIN shippers ship
				ON ship.id = o.shipper_id 
			LEFT JOIN order_details od 
				ON o.id = od.order_id 
			LEFT JOIN products p 
				ON od.product_id = p.id 
			LEFT JOIN suppliers s 
				ON p.supplier_id = s.id 
			LEFT JOIN categories c 
				ON p.category_id = c.id
	)
	SELECT
		category_name
		,COUNT(*) as num_rows
		,ROUND(AVG(price), 2) as avg_price
		,ROUND(AVG(quantity),0) as avg_quantity
	FROM
		all_data
	GROUP BY
		category_name
	HAVING
		avg_quantity > 21
		
		
-- 4f
WITH all_data AS (
		SELECT 
			o.id as order_id
			,customer_id
			,o.employee_id
			,date
			,shipper_id
			,cust.name as customer_name
			,cust.contact as customer_contact
			,cust.address as customer_address
			,cust.city
			,cust.postal_code
			,cust.country
			,last_name
			,first_name
			,birthdate
			,photo
			,notes
			,ship.name as shipper_name
			,ship.phone as shipper_phone
			,product_id
			,quantity
			,p.name as product_name
			,supplier_id
			,category_id
			,unit
			,price
			,s.name as supplier_name
			,s.contact as supplier_contact
			,s.address as supplier_address
			,s.city as supplier_city
			,s.postal_code as supplier_postal_code
			,s.country as supplier_country
			,s.phone as supplier_phone
			,c.name as category_name
			,description
		FROM
			orders o 
			RIGHT JOIN customers cust
				ON cust.id = o.customer_id 
			LEFT JOIN employees e 
				ON e.employee_id = o.employee_id 
			LEFT JOIN shippers ship
				ON ship.id = o.shipper_id 
			LEFT JOIN order_details od 
				ON o.id = od.order_id 
			LEFT JOIN products p 
				ON od.product_id = p.id 
			LEFT JOIN suppliers s 
				ON p.supplier_id = s.id 
			LEFT JOIN categories c 
				ON p.category_id = c.id
	)
	SELECT
		category_name
		,COUNT(*) as num_rows
		,ROUND(AVG(price), 2) as avg_price
		,ROUND(AVG(quantity),0) as avg_quantity
	FROM
		all_data
	GROUP BY
		category_name
	HAVING
		avg_quantity > 21
	ORDER BY
		num_rows DESC
		
-- 4f
WITH all_data AS (
		SELECT 
			o.id as order_id
			,customer_id
			,o.employee_id
			,date
			,shipper_id
			,cust.name as customer_name
			,cust.contact as customer_contact
			,cust.address as customer_address
			,cust.city
			,cust.postal_code
			,cust.country
			,last_name
			,first_name
			,birthdate
			,photo
			,notes
			,ship.name as shipper_name
			,ship.phone as shipper_phone
			,product_id
			,quantity
			,p.name as product_name
			,supplier_id
			,category_id
			,unit
			,price
			,s.name as supplier_name
			,s.contact as supplier_contact
			,s.address as supplier_address
			,s.city as supplier_city
			,s.postal_code as supplier_postal_code
			,s.country as supplier_country
			,s.phone as supplier_phone
			,c.name as category_name
			,description
		FROM
			orders o 
			RIGHT JOIN customers cust
				ON cust.id = o.customer_id 
			LEFT JOIN employees e 
				ON e.employee_id = o.employee_id 
			LEFT JOIN shippers ship
				ON ship.id = o.shipper_id 
			LEFT JOIN order_details od 
				ON o.id = od.order_id 
			LEFT JOIN products p 
				ON od.product_id = p.id 
			LEFT JOIN suppliers s 
				ON p.supplier_id = s.id 
			LEFT JOIN categories c 
				ON p.category_id = c.id
	)
	SELECT
		category_name
		,COUNT(*) as num_rows
		,ROUND(AVG(price), 2) as avg_price
		,ROUND(AVG(quantity),0) as avg_quantity
	FROM
		all_data
	GROUP BY
		category_name
	HAVING
		avg_quantity > 21
	ORDER BY
		num_rows DESC
	LIMIT 4 OFFSET 1