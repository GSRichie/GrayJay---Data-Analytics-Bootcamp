# Import dependencies
import os
import csv  

# Input file
csv_path = os.path.join("budget_data.csv")

# Track the parameters
revenue = []
date = []
revChange = []

# Read the csv
with open(csv_path) as budget_data:
    csvreader = csv.reader(budget_data)
    csv_header = next(budget_data)
    
    for row in csvreader:
        revenue.append(int(row[1]))
        date.append(row[0])    
        
# Calculate the average revenue change, and the greatest increase and decrease in revenue

for i in range(1,len(revenue)):
    revChange.append(revenue[i] - revenue[i-1])
    avg_revChange = sum(revChange)/len(revChange)
    max_revChange = max(revChange)
    min_revChange = min(revChange)
    max_revChange_date = str(date[revChange.index(max(revChange))])
    min_revChange_date = str(date[revChange.index(min(revChange))])


print("Financial Analysis")
print("-----------------------------------")
print("Total Months:", len(date))
print("Total Revenue: $", sum(revenue))
print("Avereage Revenue Change: $", round(avg_revChange))
print("Greatest Increase in Revenue:", max_revChange_date,"($", max_revChange,")")
print("Greatest Decrease in Revenue:", min_revChange_date,"($", min_revChange,")")

#Ignore the commented out block below.
#output = (
    #("\nFinancial Analysis\n")
    #("-----------------------------------\n")
    #("Total Months:", len(date))
    #("Total Revenue: $", sum(revenue))
    #("Avereage Revenue Change: $", round(avg_revChange))
    #("Greatest Increase in Revenue:", max_revChange_date,"($", max_revChange,")")
    #("Greatest Decrease in Revenue:", min_revChange_date,"($", min_revChange,")")
    
    # Path for output file
    #txt_output = os.path.join("BudgetAnalysis.txt")  
    
    # Export the results to text file
    #with open(txt_output, "w") as txt_file:
        #txt_file.write(output)      --- Will get back to this later.


# Writing to output file

with open('FinancialAnalysis.txt', 'w') as file:
    file.write("Financial Analysis\n")
    file.write("-----------------------------------\n")
    file.write('{0} {1}\n'.format("Total Months:", len(date)))
    file.write('{0} {1}\n'.format("Total Revenue: $", sum(revenue)))
    file.write('{0} {1}\n'.format("Avereage Revenue Change: $", round(avg_revChange)))
    file.write('{0} {1}\n'.format("Greatest Increase in Revenue:", max_revChange_date,"($", max_revChange,")"))
    file.write('{0} {1}\n'.format("Greatest Decrease in Revenue:", min_revChange_date,"($", min_revChange,")"))
   
   
# Path for output file
#txt_output = os.path.join("BudgetAnalysis.txt")  

# Export the results to text file
#with open(txt_output, "w") as txt_file:
    #txt_file.write(output) 