SELECT TOP (1000) [Age]
      ,[Attrition]
      ,[BusinessTravel]
      ,[DailyRate]
      ,[Department]
      ,[DistanceFromHome]
      ,[Education]
      ,[EducationField]
      ,[EmployeeCount]
      ,[EmployeeNumber]
      ,[EnvironmentSatisfaction]
      ,[Gender]
      ,[HourlyRate]
      ,[JobInvolvement]
      ,[JobLevel]
      ,[JobRole]
      ,[JobSatisfaction]
      ,[MaritalStatus]
      ,[MonthlyIncome]
      ,[MonthlyRate]
      ,[NumCompaniesWorked]
      ,[Over18]
      ,[OverTime]
      ,[PercentSalaryHike]
      ,[PerformanceRating]
      ,[RelationshipSatisfaction]
      ,[StandardHours]
      ,[StockOptionLevel]
      ,[TotalWorkingYears]
      ,[TrainingTimesLastYear]
      ,[WorkLifeBalance]
      ,[YearsAtCompany]
      ,[YearsInCurrentRole]
      ,[YearsSinceLastPromotion]
      ,[YearsWithCurrManager]
  FROM [HR-DataAnalysis].[dbo].['HR Data$']

--- Viewing the DataSet of approx 1500 rows organized
  SELECT * FROM dbo.HRData
  order by 15,19 asc

--- Removing Unneccessary Columns

ALTER TABLE dbo.HRData
DROP COLUMN 
EmployeeCount,Over18,StandardHours;

---Giving Few Columns new names
EXEC sp_rename 'dbo.HRData.Dept', 'DeptType', 'COLUMN';
EXEC sp_rename 'dbo.HRData.EmployeeNumber', 'EmpNo', 'COLUMN';
EXEC sp_rename 'dbo.HRData.DailyRate', 'DailyUSDRate', 'COLUMN';
EXEC sp_rename 'dbo.HRData.BusinessTravel', 'TravelStatus', 'COLUMN';

---Removing Redundant Values From the Dataset
SELECT DISTINCT *
INTO #TEMPTABLE
FROM dbo.HRData;

TRUNCATE TABLE dbo.HRData;

INSERT INTO dbo.HRData
SELECT * 
FROM #TEMPTABLE
;

DROP TABLE #TEMPTABLE;

SELECT *
FROM dbo.HRData


