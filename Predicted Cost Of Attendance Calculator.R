#Original Tuition price (Sticker) for all programs
Northeastern_Tuition <- 50000
Brandeis_Tuition <- 130000
AmericanU_Tuition <- 90000
GWU_Tuition <- 90000
UMD_Tuition <- 100000
Syracuse_Tuition <- 120000

#Price after predicted aid applied each school
#Northeastern 
Northeastern_With_Aid <- Northeastern_Tuition - 12000
print(Northeastern_With_Aid)

#Brandeis
Brandeis_With_Aid <- Brandeis_Tuition - 60000
print(Brandeis_With_Aid)

#American University (AU)
AU_With_Aid <- AmericanU_Tuition - 25000
print(AU_With_Aid)

#George Washington (GWU)
GWU_With_Aid <- GWU_Tuition - 12000
print(GWU_With_Aid)

#University of Maryland (UMD)
UMD_With_Aid <- UMD_Tuition - 15000
print(UMD_With_Aid)

#Syracuse 
Syracuse_with_Aid <- Syracuse_Tuition - 25000
print(Syracuse_with_Aid)

#Cost of living addition to find total cost
Boston <- c(1400, 1000)
D.C. <- c(1300, 1200)       #Monthly Rates
Syracuse <- 900

#Northeastern
Final_Northeastern <- Northeastern_With_Aid + (Boston[1] * 24)

#Brandeis
Final_Brandeis <- Brandeis_With_Aid + (Boston[2] * 24)

#AU
Final_AU <- AU_With_Aid + (D.C.[1] * 24)

#GWU 
Final_GWU <- GWU_With_Aid + (D.C.[1] * 24)

#UMD
Final_UMD <- UMD_With_Aid + (D.C.[2] * 24)

Final_Syracuse <- Syracuse_with_Aid + (Syracuse * 24)

Final_Totals <- data.frame(
  Final_Tuition = c(Northeastern_With_Aid, Brandeis_With_Aid, AU_With_Aid, GWU_With_Aid, UMD_With_Aid, Syracuse_with_Aid),
  Total_Cost = c(Final_Northeastern, Final_Brandeis, Final_AU, Final_GWU, Final_UMD, Final_Syracuse),
  row.names = c("Northeastern", "Brandeis", "American", "George Washington", "Maryland", "Syracuse")
)
print(Final_Totals)
