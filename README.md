# QSS20_Final_Project


## Title: Exploring Sentence Length Bias in Cook County Sentencing Data

## Authors: Adin McAuliffe, Jordan Miller, Sam Winchester, Sam O'Donnell 

## Description: 

This is the QSS20 Final Project Repository for Adin McAuliffe, Jordan Miller, Sam Winchester, Sam O'Donnell. In this project we use Cook County Sentencing Data to examine judicial biases in regards to race and gender. We examine how judges sentencing lengths vary based on race, gender, age and location and look at how these variations/disparities change over time.  

ADD MORE HERE LATER. 

Rubric wants: 

An informative README for the repository with a project overview, a clear description of your workflow, and a detailed description for each file:
Inputs: e.g., raw data; a file containing credentials needed to access an API
What the file does: describe major transformations.
Outputs (if any): e.g., a cleaned dataset; a figure or graph

Eunice Wants:

description of scripts (how does each analysis of disparities relate to script), data source (where its stored), and elaborate on the research question

## Table of Contents: 


### Code (In order to run)

[00_inspecting_data](https://github.com/jomillah/QSS20_Final_Project/blob/ff8537439d29da24acecd78a9d87b8d2d5114b0c/Code/00_inspecting_data.ipynb)
* Takes in: data_sentencing_clean.csv
* What it does: Inspects the data and simplifies the data in order to create a summary table. 
* Output: summary_table.csv, csv file containing table summarizing the data set 

[01_data_cleaning](https://github.com/jomillah/QSS20_Final_Project/blob/ff8537439d29da24acecd78a9d87b8d2d5114b0c/Code/01_data_cleaning.ipynb)
* Takes in: sentencing_data_withZ.csv
* What it does: Cleans the data to only include defendants who received prison sentences after pleading guilty or innocent, with only the most severe charge each defentant faces. Creates a standardized sentence length variable. Creates a variable "sentence_length_zscore" that representes sentence severity calculated using z scores. Eliminates outliers in order to ensure z scores are not skewed. 
* Output: sentencing_data_withZ.csv, csv file containing cleaned dataset with standardized sentence_length, sentence_length_zscore and no outliers

[02_creating_regression_variables](https://github.com/jomillah/QSS20_Final_Project/blob/ff8537439d29da24acecd78a9d87b8d2d5114b0c/Code/02_creating_regression_variables.ipynb)
* Takes in: sentencing_data_withZ.csv
* What it does: Changing existing boolean race and gender data to binary values. Creates a is_female_derived variable which is a binary representing whether or not a defendant is female. Creates a variable nth_case for each case which indicates how many cases the assigned judge has seen (measure of judicial experience).
* Output: sentencing_data_for_analysis.csv, csv file containing cleaned dataset with all of the necessary variables for analysis


[03_visualizations.R](https://github.com/jomillah/QSS20_Final_Project/blob/ff8537439d29da24acecd78a9d87b8d2d5114b0c/Code/03_visualizations.R)
* Takes in: sentencing_data_withZ.csv
* What it does: Creates plots for Judge Experience vs Sentence Severity (With nth_case), Age vs Sentence Severity (With age_derived),  Plea Type vs Sentence Severity (with CHARGE_DISPOSITION), Gender vs Sentence Severity (with GENDER) and Race vs Sentence Severity (With RACE). 
* Output: 
  * nth_case_plot.png, png file of plot Judge Experience vs Sentence Severity (With nth_case)
  * age_derived_plot.png, png file of plot for Age vs Sentence Severity (With age_derived)
  * is_guilty_plea_plot.png, png file of plot for Plea Type vs Sentence Severity (with CHARGE_DISPOSITION)
 * GENDER_plot.png, png file of plot for Gender vs Sentence Severity (with GENDER)
   * RACE_plot.png, png file of plot for Race vs Sentence Severity (With RACE)

[04_ols_model](https://github.com/jomillah/QSS20_Final_Project/blob/ff8537439d29da24acecd78a9d87b8d2d5114b0c/Code/04_ols_model.ipynb)
* Takes in: sentencing_data_for_analysis.csv
* What it does: Computes linear regression of continuous variables using created function ols which creates a basic Linear Model (OLS) for two variables. Then combines model results into a simple table using created function summary_col. 
* Output: table_df.csv, csv file containing table with results of regression model

[05_Decision_Tree_model](https://github.com/jomillah/QSS20_Final_Project/blob/ff8537439d29da24acecd78a9d87b8d2d5114b0c/Code/05_Decision_Tree_model.ipynb)
* Takes in: sentencing_data_for_analysis.csv
* What it does: Assigns X and Y variables for the Decision Tree Model, splits data into training and testing data, and creates a decision tree model using  DecisionTreeClassifier(). Then tests model on test set of data and turns results into a table. 
* Output: 
  * DT_standard_error_table.csv, csv file containing table with error results of decision tree model training and testing
  * DT_feature_importance_table.csv, csv file containing table with feature importances for decision tree model 

[06_Random_Forest_model](https://github.com/jomillah/QSS20_Final_Project/blob/ff8537439d29da24acecd78a9d87b8d2d5114b0c/Code/06_Random_Forest_model.ipynb)
* Takes in: sentencing_data_for_analysis.csv
* What it does: Assigns X and Y variables for the random forest model, splits data into training and testing data, and creates a random forestmodel using  RandomForestClassifier(). Then tests model on test set of data and turns results into a feature importance table and an error table. 
* Output: 
  * RF_standard_error_table.csv, csv file containing table with error results of rain forest model training and testing
  * RF_standard_error_table.csv, csv file containing table with feature importances for rain forest model 












### Visualizations 

### Data - 

### Memos




