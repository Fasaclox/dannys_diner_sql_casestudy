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
