# QSS20_Final_Project


Title: Exploring Sentence Length Bias in Cook County Sentencing Data

Authors: Adin McAuliffe, Jordan Miller, Sam Winchester, Sam O'Donnell 

Table of Contents: 
Code - contain 00_data_cleaning_merging 
  00_data_cleaning_merging 
    Input: Cook County Sentencing Data sentencing_clean (.zip file)
    Functionality 
    Reads in sentencing clean data 
    Creates some new variables 
sentencing_clean.csv.zip - Zip file containing sentencing_clean.csv which holds the clean sentencing data

Description: 

This is the beginning of the QSS20 Final Project Repository for Adin McAuliffe, Jordan Miller, Sam Winchester, Sam O'Donnell. In this project we use Cook County Sentencing Data to examine judicial biases in regards to race and gender. We examine how judges sentencing lengths vary based on race, gender, age and location and look at how these variations/disparities change over time.  

For a racial disparity analysis, we filter the dataset to judges who have sentenced more than 25 black, 25 white, and 25 hispanic defendants over years for the five most common crimes. We then produce the mean and median sentence length for each race and compare across judges. 

For a gender disparity analysis, we filter the dataset to judges who have sentenced more than 25 men and 25 women for the five most common crimes. We then produce the mean and median sentence length for each gender and compare across judges. 

For each of these biases we will create a severity variable that represents the standard deviation of each sentence length compared to the median sentence length for that specific charge. 

For a geographical analysis, we will compare sentence lengths and sentence severity in each of the different locations within the Cook County data. 


Note: We may modify the numbers by which we filter each disparity as necessary. 
