/* 
 * Danny's Diner
 * Case Study #1 Questions
 *  
*/

-- 1. What is the total amount each customer spent at the restaurant?

SELECT 
    CUSTOMER_ID, 
    SUM(ORDERS * PRICE)AS TOTAL_AMOUNT 
FROM 
    (SELECT 
        CUSTOMER_ID,
        COUNT(ORDER_DATE) AS ORDERS,
        PRODUCT_NAME,
        PRICE
    FROM SALES AS S INNER JOIN MENU AS M ON S.PRODUCT_ID= M.PRODUCT_ID
    GROUP BY CUSTOMER_ID, PRODUCT_NAME, PRICE) AS T
GROUP BY CUSTOMER_ID

--OR

SELECT 
    CUSTOMER_ID, 
    SUM(PRICE) AS TOTAL_AMOUNT
FROM
    SALES AS S INNER JOIN MENU AS M ON S.PRODUCT_ID= M.PRODUCT_ID
GROUP BY CUSTOMER_ID
ORDER BY CUSTOMER_ID DESC;


-- 2. How many days has each customer visited the restaurant?

SELECT 
    CUSTOMER_ID, 
    COUNT (DISTINCT(ORDER_DATE)) AS DAYS_VISITED
FROM 
    SALES
GROUP BY CUSTOMER_ID 

-- 3. What was the first item from the menu purchased by each customer?

SELECT 
    CUSTOMER_ID, 
    PRODUCT_NAME, 
    ORDER_DATE
FROM SALES AS SS INNER JOIN MENU AS MM ON SS.PRODUCT_ID = MM.PRODUCT_ID
WHERE ORDER_DATE = (SELECT MIN(ORDER_DATE)
                    FROM Sales
                    WHERE CUSTOMER_ID = CUSTOMER_ID)
GROUP BY CUSTOMER_ID, PRODUCT_NAME, ORDER_DATE
ORDER BY CUSTOMER_ID

--4. What is the most purchased item on the menu and how many times was it purchased by all customers?
SELECT
    TOP 1 COUNT(S.PRODUCT_ID) AS TOTAL_ORDER,
    PRODUCT_NAME
FROM    
    SALES AS S INNER JOIN MENU AS M ON  S.PRODUCT_ID=M.PRODUCT_ID
GROUP BY PRODUCT_NAME
ORDER BY TOTAL_ORDER DESC
