
#MySQL

#Question 1 - Which brand saw the most dollars spent in the month of June?

#Join brands to receipt_items where barcode or brand code are equal
#Join receipts to receipt_items where IDs are equal

SELECT brands.BRAND_CODE, SUM(receipt_items.TOTAL_FINAL_PRICE) AS Total
FROM ((receipt_items
	INNER JOIN brands ON brands.BRAND_CODE = receipt_items.BRAND_CODE OR brands.BARCODE = receipt_items.BARCODE)
	INNER JOIN receipts ON receipts.ID = receipt_items.REWARDS_RECEIPT_ID);
WHERE MONTH(receipts.PURCHASE_DATE=6
GROUP BY brands.BRAND_CODE
ORDER BY Total DESC;

#Question 2

#Which user spent the most money in the month of August?

SELECT USER_ID, SUM(TOTAL_SPENT) AS TOTAL_IN_AUGUST 
FROM receipts
WHERE MONTH(PURCHASE_DATE)=8
GROUP BY USER_ID
ORDER BY TOTAL_IN_AUGUST DESC;

#Question 3+4
#What user bought the most expensive item?
#What is the name of the most expensive item purchased?

SELECT receipts.USER_ID, receipt_items.TOTAL_FINAL_PRICE, receipt_items.DESCRIPTION
FROM receipts, receipt_items
WHERE receipts.ID=receipt_items.REWARDS_RECEIPT_ID
ORDER BY receipt_items.TOTAL_FINAL_PRICE DESC;


#Question 5
#How many users scanned in each month?
#assuming this question means unique users per month

SELECT COUNT(DISTINCT(USER_ID), MONTH(DATE_SCANNED)
FROM receipts
GROUP BY MONTH(OrderDate);





