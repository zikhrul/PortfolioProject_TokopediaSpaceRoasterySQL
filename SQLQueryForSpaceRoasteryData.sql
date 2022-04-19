/*
Queries used for Tableau Project
*/
-- Looking the data
Select *
From PortfolioProject..TokopediaSpaceRoastery$
order by 1


-- 1. For Tableau Table 1
-- Seeing the total item sold, total review, and how many people giving review on their tokopedia page

Select SUM(SoldQty) as Total_Item_Sold, SUM(TotalReview) as Total_Review, (SUM(TotalReview)/SUM(SoldQty))*100 as PeopleGivingReviewPercentage
From PortfolioProject..TokopediaSpaceRoastery$
order by 1,2


-- 2. For Tableau Table 2

-- Looking for the most selling product per category

Select Category, SUM(SoldQty) as TotalSoldProduct, (SUM(SoldQty)*SUM(Pack_in_grams))/1000000 as TotalSoldProductPerTon
From PortfolioProject..TokopediaSpaceRoastery$ 
Group by Category
order by 2 desc


-- 3. For Tableau Table 3
-- I want to know the top 10 best selling product of Space Roastery on Tokopedia

Select Name, SUM(SoldQty) as TotalSoldProduct
From PortfolioProject..TokopediaSpaceRoastery$
Group by Name
order by 2 desc


-- 4. For Tableau Table 4
-- I want to know the customer habits, how much coffee they buy by seeing the pack they order. It may not representative

Select Pack_in_grams as Pack_in_grams, SUM(SoldQty) as TotalSoldProduct
From PortfolioProject..TokopediaSpaceRoastery$
Group by Pack_in_grams
order by 2 desc

-- 5. For Tableu Table 5
-- I want to know which region is the customer's favorite, so I exclude the blend

Select Region, Country, SUM(SoldQty) as TotalSoldProduct
From PortfolioProject..TokopediaSpaceRoastery$
WHERE Region NOT LIKE '%Blend'
and region NOT LIKE '%Mixed'
Group by Region, Country
order by 3 desc