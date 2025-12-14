#Use to predict best possible outcome based off vectors and data.frames
#Ex. Pick best graduate school with Values of Cost, Job Placement, Program Fit, Internship Opportunities, etc...

#Part 1: Craft data.frame table with school labels and ratings 1-100 based on performance in each area

library(tibble)
library(dplyr)
library(ggplot2) #Call tibble functions to be available from R function library

#Creates a clean data frame
Best_Grad_School <- tibble(
  name = c("Oregon:", "Montana:", "Hawaii:", "UNH:", "Louisiana:", "New Mexico State:") ,  #Plug in school names
  cost_of_attendance = c(98, 86, 91, 75, 93, 82) ,
  prestige = c(81, 87, 91, 95, 84, 86),            #Plug in rating for each schools section based on research/ data
  job_placement = c(89, 88, 92, 93, 86, 86),
  program_fit = c(85, 85, 88, 92, 85, 91),
  internships = c(93, 86, 87, 85, 84, 83),
  aid_opportunities = c(89, 90, 85, 85, 91, 86)
)
(Best_Grad_School) #don't need to use print function w/tibble

#Part 2
# Mean/average/ the points of each school
#finds the best average -> best school, using vector data

library(dplyr)   #Call to open/ unlock functions from dplyr package, already downloaded on my R, but needs to be loaded into this specific file/ code
Best_Grad_School <- Best_Grad_School %>%  
  mutate(
    Average = rowMeans(across(where(is.numeric))) ,
    Points_gained = rowSums(across(where(is.numeric))) - Average
  )

Best_Grad_School#Returns average of the five sections, finds school w highest point total out of 100

#Part 3: Filter out data, select which sections are more important, or even transform data 
#Only find schools with job_placement above 85 and cost of attendance rating above 85, can change these to fit your preferred criteria
Best_ROI <- Best_Grad_School %>%
  filter(cost_of_attendance >= 85, job_placement >= 85, aid_opportunities >= 85)

Best_ROI #Prints schools that fit criteria above 

#Part 4: Visualization of data, bar graph of average points per school
library(ggplot2)  #Call to open/ unlock functions from ggplot2 package
ggplot(Best_Grad_School, aes(x = name, y = Average, fill = name)) +     #can be altered to show other sections by changing y = Average to y = job_placement, etc...
  geom_bar(stat = "identity") +
  labs(title = "Average Points per Graduate School", x = "Graduate School", y = "Average Points") +
  theme_minimal() +
  theme(legend.position = "none")
#Creates bar graph of average points per school
