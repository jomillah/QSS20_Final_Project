# QSS20_Final_Project


## Title:
Exploring Sentence Length Bias in Cook County Sentencing Data

## Authors: 
Adin McAuliffe, Jordan Miller, Sam Winchester, Sam O'Donnell 

## Description: 

This is the QSS20 Final Project Repository for Adin McAuliffe, Jordan Miller, Sam Winchester, Sam O'Donnell. In this project we use Cook County Sentencing Data to examine judicial biases in regards to race and gender. We examine how judges sentencing lengths vary based on race, gender, age and location and look at how these variations/disparities change over time.  

## Table of Contents: 


### Code (In order to run)

[00_inspecting_data](https://github.com/jomillah/QSS20_Final_Project/blob/ff8537439d29da24acecd78a9d87b8d2d5114b0c/Code/00_inspecting_data.ipynb)
* Takes in: 
  * data_sentencing_clean.csv
* What it does: 
  * Converts data_sentencing_clean.csv file into a dataframe using pd.read from `pandas` package
  * Inspects the data using head, shape and info functions from `pandas` package
  * Simplifies the data by subsetting to variables relevant to analysis, converts numerics to strings, and converting the dates in sentenceymd_derived to datetime formate via to_datetime from the `pandas` package
  * Creates a table summarizing te data based off of the simplified data
* Output: 
  * Simplified_Summary_Table.csv, csv file containing table summarizing the data set

[01_data_cleaning](https://github.com/jomillah/QSS20_Final_Project/blob/ff8537439d29da24acecd78a9d87b8d2d5114b0c/Code/01_data_cleaning.ipynb)
* Takes in: 
  * data_sentencing_clean.csv
* What it does: 
  * Converts data_sentencing_clean.csv file into a dataframe using pd.read from `pandas` package
  * Cleans the data to only include defendants who received prison sentences after pleading guilty or innocent, with only the most severe charge each defentant faces
  * Creates a standaridized sentence length variable sentence_length by standardizing values in COMMITMENT_TERM. 
  * Creates a variable "sentence_length_zscore" that representes sentence severity calculated using zscore from `scipy.stats` package
 n* Eliminates outliers with IQR * 1.5 method in order to ensure z scores are not skewed. 
* Output: 
  * sentencing_data_withZ.csv, csv file containing cleaned dataset with standardized sentence_length, sentence_length_zscore and no outliers, stored in Data folder

[02_creating_regression_variables](https://github.com/jomillah/QSS20_Final_Project/blob/ff8537439d29da24acecd78a9d87b8d2d5114b0c/Code/02_creating_regression_variables.ipynb)
* Takes in: 
  * sentencing_data_withZ.csv, created in 01_data_cleaning
* What it does: 
  * Changing existing boolean race and gender data to binary values
  * Creates the variables necessary to do a regression model in relation to the factors we want to analyze. 
  * Creates binary variables s_guilty_plea and is_innocent_plea that represent innocent and guilty pleas from CHARGE_DISPOSITION so that later we can measure how a defendant;s plea affects their sentencing severity
  * Creates a is_female_derived variable which is a binary representing whether or not a defendant is female so that later we can measure how a defendant's gender affects their sentencing severity
  * Creates a variable nth_case for each case which indicates how many cases the assigned judge has seen (measure of judicial experience)so that later we can measure how a judge's experience affects sentencing severity for a defendant 
* Output: 
  * sentencing_data_for_analysis.csv, csv file containing cleaned dataset with all of the necessary variables for analysis, stored in Data folder 


[03_visualizations](https://github.com/jomillah/QSS20_Final_Project/blob/ff8537439d29da24acecd78a9d87b8d2d5114b0c/Code/03_visualizations.R)
* Takes in: 
  * sentencing_data_for_analysis.csv, created in 02_creating_regression_variables
* What it does: 
 *Creates visuals to help convey connection between different factors and sentencing severity. Uses `ggplot2` to create plots as visuals for 
  *Judge Experience vs Sentence Severity (With nth_case)
  *Age vs Sentence Severity (With age_derived)
  *Plea Type vs Sentence Severity (with CHARGE_DISPOSITION)
  *Gender vs Sentence Severity (with GENDER) and Race vs Sentence Severity (With RACE). 
* Output: 
  * nth_case_plot.png, png file of plot Judge Experience vs Sentence Severity (With nth_case)
  * age_derived_plot.png, png file of plot for Age vs Sentence Severity (With age_derived)
  * is_guilty_plea_plot.png, png file of plot for Plea Type vs Sentence Severity (with CHARGE_DISPOSITION)
  * GENDER_plot.png, png file of plot for Gender vs Sentence Severity (with GENDER)
  * RACE_plot.png, png file of plot for Race vs Sentence Severity (With RACE)

[04_ols_model](https://github.com/jomillah/QSS20_Final_Project/blob/ff8537439d29da24acecd78a9d87b8d2d5114b0c/Code/04_ols_model.ipynb)
* Takes in:
  * sentencing_data_for_analysis.csv, created in 02_creating_regression_variables
* What it does: 
  *Computes linear regression of continuous variables ("age_derived", "is_guilty_plea", "nth_case", "is_female_derived", "is_innocent_plea", "is_male_derived", "is_black_derived", "is_white_derived", "is_hisp_derived", "is_other_derived") with respect to "sentence_length_zscore" using ols from `statsmodels` which creates a basic Linear Model (OLS) for two variables
  * Then uses summary_col from `statsmodels` to combine OLS model results into a simple table in order to visualize regression results 
* Output: 
  * OLS_table.csv, csv file containing table with results of regression model

[05_Decision_Tree_model](https://github.com/jomillah/QSS20_Final_Project/blob/ff8537439d29da24acecd78a9d87b8d2d5114b0c/Code/05_Decision_Tree_model.ipynb)
* Takes in: 
  * sentencing_data_for_analysis.csv, created in 02_creating_regression_variables
* What it does: 
  * Assigns X and Y variables for the decision tree model with X variables being "is_guilty_plea", "nth_case", "is_female_derived", "is_innocent_plea", "is_male_derived", "is_black_derived", "is_white_derived", "is_hisp_derived", "is_other_derived", "age_derived" from the sentencing data for analysis and the Y variable being "sentence_length_zscore" in order to understand how these factors affect sentence severity 
  * Splits sentencing data for analysis into training and testing datasets using train_test_split from `sklearn` package
  * Creates a decision tree model based off of training data using  DecisionTreeClassifier from `sklearn` package
  * Then tests model on test set of data
  * Uses results of this test to create a results table in order to visualize how well model does
* Output: 
   * DT_standard_error_table.csv, csv file containing table with table with mean squared error, mean absolute error and r-squared for error results of decision tree model training and testing
   * DT_feature_importance_table.csv, csv file containing table with feature importances for decision tree model 

[06_Random_Forest_model](https://github.com/jomillah/QSS20_Final_Project/blob/ff8537439d29da24acecd78a9d87b8d2d5114b0c/Code/06_Random_Forest_model.ipynb)
* Takes in: 
  * sentencing_data_for_analysis.csv, created in 02_creating_regression_variables
* What it does: 
  * Assigns X and Y variables for the random forest model with X variables being "is_guilty_plea", "nth_case", "is_female_derived", "is_innocent_plea", "is_male_derived", "is_black_derived", "is_white_derived", "is_hisp_derived", "is_other_derived", "age_derived" from the sentencing data for analysis and the Y variable being "sentence_length_zscore" in order to understand how these factors affect sentence severity
  * Splits sentencing data for analysis into training and testing datasets using train_test_split from `sklearn` package
  * Creates a random forestmodel using  RandomForestClassifier from `sklearn` package
  * Tests model on test set of data 
  * Uses results of this test to create a feature importance table and an error table in order to visualize how well model does
* Output: 
   * RF_standard_error_table.csv, csv file containing table with error results of random forest model training and testing
   * RF_feature_importance_table, csv file containing table with feature importances for random forest model 


### Data 
* [sentencing_cleaned.csv.zip](https://github.com/jomillah/QSS20_Final_Project/blob/276173275b9c782025554d401b0edf7b23cd4b19/Data/sentencing_cleaned.csv.zip), zip file containing sentencing_cleaned.csv
* [sentencing_cleaned.csv](https://github.com/jomillah/QSS20_Final_Project/blob/276173275b9c782025554d401b0edf7b23cd4b19/Data/sentencing_cleaned.csv), csv file containing sentencing data unzipped from sentencing_cleaned.csv.zip originally cleaned by Jaren Haber. The original data set can be found [at the Cook County government's website](https://datacatalog.cookcountyil.gov/api/views/tg8v-tm6u/files/8597cdda-f7e1-44d1-b0ce-0a4e43f8c980?download=true&filename=CCSAO%20Data%20Glossary.pdf).
* [sentencing_data_for_analysis.csv](https://github.com/jomillah/QSS20_Final_Project/blob/276173275b9c782025554d401b0edf7b23cd4b19/Data/sentencing_data_for_analysis.csv), csv file created in 02_creating_regression_variables containing cleaned sentencing data with all of the necessary variables for regression analysis 
* [sentencing_data_withZ.csv](https://github.com/jomillah/QSS20_Final_Project/blob/276173275b9c782025554d401b0edf7b23cd4b19/Data/sentencing_data_withZ.csv), csv file created in 01_data_cleaning containing cleaned sentencing data including standardized sentence_length, sentence_length_zscore and with no outliers

### Output
#### Tables 
* [DT_feature_importance_table.csv](https://github.com/jomillah/QSS20_Final_Project/blob/276173275b9c782025554d401b0edf7b23cd4b19/Output/Tables/DT_feature_importance_table.csv), csv file created in 05_Decision_Tree_model containing table with feature importances for decision tree model 
* [DT_standard_error_table.csv](https://github.com/jomillah/QSS20_Final_Project/blob/276173275b9c782025554d401b0edf7b23cd4b19/Output/Tables/DT_standard_error_table.csv), csv file created in 05_Decision_Tree_model containing table with mean squared error, mean absolute error and r-squared for decision tree model
* [OLS_table](https://github.com/jomillah/QSS20_Final_Project/blob/276173275b9c782025554d401b0edf7b23cd4b19/Output/Tables/OLS_table.csv), csv file created in 04_ols_model containing a table with results of regression model
* [RF_feature_importance_table](https://github.com/jomillah/QSS20_Final_Project/blob/276173275b9c782025554d401b0edf7b23cd4b19/Output/Tables/RF_feature_importance_table.csv), csv file created in 06_Random_Forest_model containing table with feature importances for Random Forest Model 
* [RF_standard_error_table](https://github.com/jomillah/QSS20_Final_Project/blob/276173275b9c782025554d401b0edf7b23cd4b19/Output/Tables/RF_standard_error_table.csv), csv file created in 06_Random_Forest_model containing table with error results of Random forest model training and testing
* [Simplified_Summary_Table](https://github.com/jomillah/QSS20_Final_Project/blob/276173275b9c782025554d401b0edf7b23cd4b19/Output/Tables/Simplified_Summary_Table.csv), csv file created in 00_inspecting_data containing table summarizing the data set 


#### Visualizations 
* [GENDER_plot](https://github.com/jomillah/QSS20_Final_Project/blob/276173275b9c782025554d401b0edf7b23cd4b19/Output/Visualizations/GENDER_plot.png), png file of plot for Gender vs Sentence Severity (with GENDER) showing how a defendant's gender impacts their sentencing severity created in 03_visualizations
* [RACE_plot](https://github.com/jomillah/QSS20_Final_Project/blob/276173275b9c782025554d401b0edf7b23cd4b19/Output/Visualizations/RACE_plot.png), png file of plot for Race vs Sentence Severity (With RACE) showing how a defendant's race impacts their sentencing severity created in 03_visualizations
* [age_derived_plot](https://github.com/jomillah/QSS20_Final_Project/blob/276173275b9c782025554d401b0edf7b23cd4b19/Output/Visualizations/age_derived_plot.png), png file of plot for Age vs Sentence Severity (With age_derived) showing how a defendant's age impacts their sentencing severity, created in 03_visualizations
* [nth_case_plot](https://github.com/jomillah/QSS20_Final_Project/blob/276173275b9c782025554d401b0edf7b23cd4b19/Output/Visualizations/nth_case_plot.png),  png file of plot Judge Experience vs Sentence Severity (With nth_case) showing how a judge's experience impacts the defendant's sentencing severity, created in 03_visualizations

#### Final Paper 
* [Final_Paper](https://github.com/jomillah/QSS20_Final_Project/blob/2f5638e41449dd5bfbc20d09b36f0814ccd62df8/Final_Paper.pdf) pdf file containing final paper analyzing results from code 
