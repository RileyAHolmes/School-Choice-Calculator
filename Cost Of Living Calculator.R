# The below code simulates a budget over a 2 year (24-month period), accounting for monthly expenses and income, including higher income during summer months. It tracks the remaining funds each month and stops if funds run out or the 24-month period ends.
# Designed specifically for graduate school budgeting, can be altered to Undergrad by changing month > 24 to month > 48 at the bottom of this code, make sure to add months of summer pay ex. 34, 35 for year 3, and change any other figures/ numbers to your current standings.

Beginning_funds <- 10000   # Start of school/year funds
rent <- 1000            # Monthly rent
other_expenses <- 500   # Miscellaneous/ living expenses
regular_pay <- 1000     # Regular monthly income
month <- 1
summer_pay <- 2500      # Higher income during summer months

while(Beginning_funds > 0) {
  if (month %in% c(9, 10, 11, 12, 21, 22, 23, 24)) {     # Calculation of pay 
    money_made <- summer_pay                             # During summer months
  } else {
    money_made <- regular_pay                            # During regular/school months
  }
  total_expenses <- rent + other_expenses
  new_funds <- Beginning_funds + money_made - total_expenses     # New funds calculation after expenses and income
  
  print(paste("Month:", month, "Funds Remaining:", new_funds))
  
  Beginning_funds <- new_funds
  month <- month +1              # Increment month counter, as month goes up 1 the expenses + income calculation runs again
  
  if (new_funds <= 0 | month > 24) {
    print("Broke")                     # If in any given month funds reach under 0, the loop stops and prints "Broke"
    break
  }    
}
print(paste("Total amount remaining, end of year:", Beginning_funds))   # Prints total remaining funds at end of 2 year (24 month) graduate school program
