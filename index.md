---
title       : US Public High School Enrollment
author      : pkidambi  
job         : 
framework   : html5slides      
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## United States Public High School Enrollment

1. The product showcases the United States Public High School Enrollment trends over a timeline by US State, type of student and grade

2. The product can be accessed at (https://pkidambi.shinyapps.io/US_Public_HS_Enrollment) and the source code can be accessed at (https://github.com/pkidambi/US_Public_HS_Enrollment)

3. The data used for this product was downloaded from [Western Interstate Commission for Higher Education (WICHE)](http://knocking.wiche.edu/download) portal

Author: PKidambi

--- .class #id 

## Input Data File
Summary of the input data is showcased using the **summary** command in R


```r
# read the data
summary(mydata,4)
```

```
##      State                                    Type           Year     
##  AK     : 192   American Indian/AlAsianka Native:1632   1996   : 306  
##  AL     : 192   Asian                           :1632   1997   : 306  
##  AR     : 192   Black non-Hispanicspanic        :1632   1998   : 306  
##  (Other):9216   (Other)                         :4896   (Other):8874  
##     Grade.9        Grade.10       Grade.11       Grade.12   
##  0      : 982   0      : 679   0      : 375   0      :  71  
##  114    :  15   210    :  13   66     :  15   135    :  15  
##  79     :  11   74     :  13   135    :  13   57     :  14  
##  (Other):8784   (Other):9087   (Other):9389   (Other):9692  
##     Diploma     Region  
##  0      :  22   M:1920  
##  63     :  16   N:1728  
##  49     :  14   S:3264  
##  (Other):9740   W:2880
```
 

--- .class #id 

## Product Inputs
The end user can select the *United States State*, *Student Type* and *Timeframe for analysis* as showcased in the figure below 


![Input](input.JPG)



--- .class #id 

## Product Outputs
The output is a US map with the selected US state highlighted and labeled, and bar plots of the high school enrollments in the selected time frame as showcased in the figure below. 


![Output](output.JPG)


--- .class #id 

## Download & Future Updates
1. The data based on the end user inputs can be downloaded by clicking the download button on the **Data** tab. More information about the product can be found by clicking on **About** tab. 

2. Obtain US private school enrollment data and add it to our database

3. Update the product with primary school and middle school data

4. Create a prediction algorithm to predict the enrollment trends after 2027
--- 
