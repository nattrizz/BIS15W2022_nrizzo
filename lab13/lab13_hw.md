---
title: "Lab 13 Homework"
author: "Natalie Rizzo"
date: "2022-02-28"
output:
  html_document:
    theme: spacelab
    toc: no
    keep_md: yes
---



## Instructions
Answer the following questions and complete the exercises in RMarkdown. Please embed all of your code and push your final work to your repository. Your final lab report should be organized, clean, and run free from errors. Remember, you must remove the `#` for the included code chunks to run. Be sure to add your name to the author header above. For any included plots, make sure they are clearly labeled. You are free to use any plot type that you feel best communicates the results of your analysis.  

Make sure to use the formatting conventions of RMarkdown to make your report neat and clean!  

## Libraries

```r
library(tidyverse)
library(shiny)
library(shinydashboard)
```
## Option 2
We will use data from a study on vertebrate community composition and impacts from defaunation in Gabon, Africa. Reference: Koerner SE, Poulsen JR, Blanchard EJ, Okouyi J, Clark CJ. Vertebrate community composition and diversity declines along a defaunation gradient radiating from rural villages in Gabon. _Journal of Applied Ecology_. 2016.   

**1. Load the `IvindoData_DryadVersion.csv` data and use the function(s) of your choice to get an idea of the overall structure, including its dimensions, column names, variable classes, etc. As part of this, determine if NA's are present and how they are treated.**  

```r
gabon<- read.csv("data/gabon_data/IvindoData_DryadVersion.csv")
```

```r
head(gabon)
```

```
##   TransectID Distance  HuntCat NumHouseholds LandUse Veg_Rich Veg_Stems
## 1          1     7.14 Moderate            54    Park    16.67     31.20
## 2          2    17.31     None            54    Park    15.75     37.44
## 3          2    18.32     None            29    Park    16.88     32.33
## 4          3    20.85     None            29 Logging    12.44     29.39
## 5          4    15.95     None            29    Park    17.13     36.00
## 6          5    17.47     None            29    Park    16.50     29.22
##   Veg_liana Veg_DBH Veg_Canopy Veg_Understory RA_Apes RA_Birds RA_Elephant
## 1      5.78   49.57       3.78           2.89    1.87    52.66        0.00
## 2     13.25   34.59       3.75           3.88    0.00    52.17        0.86
## 3      4.75   42.82       3.43           3.00    4.49    37.44        1.33
## 4      9.78   36.62       3.75           2.75   12.93    59.29        0.56
## 5     13.25   41.52       3.88           3.25    0.00    52.62        1.00
## 6     12.88   44.07       2.50           3.00    2.48    38.64        0.00
##   RA_Monkeys RA_Rodent RA_Ungulate Rich_AllSpecies Evenness_AllSpecies
## 1      38.59      4.22        2.66              22               0.793
## 2      28.53      6.04       12.41              20               0.773
## 3      41.82      1.06       13.86              22               0.740
## 4      19.85      3.66        3.71              19               0.681
## 5      41.34      2.52        2.53              20               0.811
## 6      43.29      1.83       13.75              22               0.786
##   Diversity_AllSpecies Rich_BirdSpecies Evenness_BirdSpecies
## 1                2.452               11                0.732
## 2                2.314               10                0.704
## 3                2.288               11                0.688
## 4                2.006                8                0.559
## 5                2.431                8                0.799
## 6                2.429               10                0.771
##   Diversity_BirdSpecies Rich_MammalSpecies Evenness_MammalSpecies
## 1                 1.756                 11                  0.736
## 2                 1.620                 10                  0.705
## 3                 1.649                 11                  0.650
## 4                 1.162                 11                  0.619
## 5                 1.660                 12                  0.736
## 6                 1.775                 12                  0.694
##   Diversity_MammalSpecies
## 1                   1.764
## 2                   1.624
## 3                   1.558
## 4                   1.484
## 5                   1.829
## 6                   1.725
```

```r
names(gabon)
```

```
##  [1] "TransectID"              "Distance"               
##  [3] "HuntCat"                 "NumHouseholds"          
##  [5] "LandUse"                 "Veg_Rich"               
##  [7] "Veg_Stems"               "Veg_liana"              
##  [9] "Veg_DBH"                 "Veg_Canopy"             
## [11] "Veg_Understory"          "RA_Apes"                
## [13] "RA_Birds"                "RA_Elephant"            
## [15] "RA_Monkeys"              "RA_Rodent"              
## [17] "RA_Ungulate"             "Rich_AllSpecies"        
## [19] "Evenness_AllSpecies"     "Diversity_AllSpecies"   
## [21] "Rich_BirdSpecies"        "Evenness_BirdSpecies"   
## [23] "Diversity_BirdSpecies"   "Rich_MammalSpecies"     
## [25] "Evenness_MammalSpecies"  "Diversity_MammalSpecies"
```

**2. Build an app that re-creates the plots shown on page 810 of this paper. The paper is included in the folder. It compares the relative abundance % to the distance from villages in rural Gabon. Use shiny dashboard and add aesthetics to the plot.  **  

```r
ui<- dashboardPage(
  dashboardHeader(title = "Relative Abundance of Different Animals"), dashboardSidebar(disable = T), dashboardBody(
    fluidRow(
      box(title = "Plot Options", width= 2, selectInput( "x", "Select RA Taxon", choices = c("RA_Apes", "RA_Birds", "RA_Elephant", "RA_Monkeys", "RA_Rodent","RA_Ungulate"), selected = "RA_Apes"))),
    box(title = "Relative Abundance"), width=4, plotOutput("plot", width = "700px", height="500px")))

server<- function(input, output, session){
  output$plot<- renderPlot({
    gabon %>% 
      ggplot(aes_string(x="Distance", y=input$x))+geom_point()
  })
  session$onSessionEnded(stopApp)
}
shinyApp(ui, server)
```

preservee08afb80be4f3c16

## Push your final code to GitHub!
Please be sure that you check the `keep md` file in the knit preferences. 
