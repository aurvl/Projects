
# DATA ANALYSIS AND EMPLOYMENT POLICY GUIDANCE FOR 2024
print('SECTION 1')
# SECTION 1: DATA ARRANGEMENT
# Question 1
print("Question 1")
country = {
    1: 'France',
    2: 'Germany',
    3: 'Italy',
    4: 'Netherlands',
    5: 'United Kingdom'
}
print(country)

print()

# Question 2
print("Question 2")
france_data = [6.1, 7.2]
germany_data = [6.3, 2.9]
italy_data = [6.4, 8.1]
netherlands_data = [3.2, 3.7]
uk_data = [6.9, 4.2]

print("Country: [Inflation rate, Unemployment rate]")
print(f"France:", france_data)
print(f"Germany:", germany_data)
print(f"Italy:", italy_data)
print(f"Netherlands:", netherlands_data)
print(f"United Kingdom:", uk_data)

print()

# Question 3
print("Question 3")
# We create a list of lists
data_lists = [france_data, germany_data, italy_data, netherlands_data, uk_data]
print('data list =', data_lists)
print()
active_pop_2023 = [19, 32, 17, 16, 22]

# Define a function to calculate the number of unemployed (in millions) for each country in 2023
def calculate_unemployed(data_lists, active_pop_2023):
    unemployed = []
    for i in range(len(data_lists)):
        unemployment_rate = data_lists[i][1]  # Get the unemployment rate from the data
        unemployed_millions = (unemployment_rate / 100) * active_pop_2023[i]
        unemployed.append(round(unemployed_millions, 2))
    return unemployed

# Calculate the number of unemployed (in millions) for each country
unemployed_2023 = calculate_unemployed(data_lists, active_pop_2023)

# Add the results to the existing lists
for i in range(len(data_lists)):
    data_lists[i].append(unemployed_2023[i])

# Print the updated lists with unemployment data
for i, country_data in enumerate(data_lists):
    countries = ["France", "Germany", "Italy", "Netherlands", "United Kingdom"][i]
    print(countries, "Inflation, unemployment rates and Unemployed in millions:", country_data)

print()

# SECTION 2: ESTIMATING THE PHILLIPS CURVE
print('SECTION 2')
# In this section, we will estimate Phillips' relationship for the year 2024
# Question 1
print("Question 1")
# Define the inflation rates and unemployment rates for each country
inflation_rate_2024 = [3.1, 3.0, 3.0, 2.2, 2.8]
unemployment_rate_2024 = [7.2, 2.8, 8.1, 4.0, 4.5]

# Define a function to calculate the average of a list of values
def calculate_average(values):
    if len(values) == 0:
        return 0  # Handle the case where the list is empty
    total = sum(values)
    return total / len(values)

# Calculate the average inflation rate and the average unemployment rate
average_inflation = calculate_average(inflation_rate_2024)
average_unemployment = calculate_average(unemployment_rate_2024)


# Create the "OECD" list by adding the inflation/unemployment ratio to the averages
OECD = [average_inflation, average_unemployment]

# Print the results
print("Average Inflation Rate:", average_inflation)
print("Average Unemployment Rate:", average_unemployment)
print("OECD List (Average Inflation, Average Unemployment):", OECD)

print()

# Question 2
print("Question 2")
# Calculate the sum of differences between each inflation rate and the average
sum1 = 0
for i, j in zip(inflation_rate_2024, unemployment_rate_2024):
    sum_of_product = (i - average_inflation)*(j - average_unemployment)
    sum1 = sum1 + sum_of_product

sum2 = 0
for i in unemployment_rate_2024:
    sum_of_differences_unemployment = (i - average_unemployment)**2
    sum2 = sum2 + sum_of_differences_unemployment 

alpha = sum1/sum2
alpha = round(alpha, 2)
print("The OLS estimator of our regression is:", alpha)

# Calculate the parameter Z
Z = average_inflation - alpha * average_unemployment
Z = round(Z, 2)
print("The intercept of the model Z (reservation wage) is:", Z)

# Model expression
print ("The model is : : ∆π =", Z, " + ", alpha, " * ∆U")

print()

# Question 3
print("Question 3")
unemployment_rate_2023 = [7.2, 2.9, 8.1, 3.7, 4.2]
natural_unemployment_rate = 5
countries = ["France", "Germany", "Italy", "Netherlands", "United Kingdom"]

# Function who computes the difference between a u_rate variable and the natural unemployment rate
def unemployment_gap_calculator(u_rate, natural_unemployment_rate):
    return u_rate - natural_unemployment_rate
unemployment_gaps = []
for rate, country in zip(unemployment_rate_2023, countries):
    gap = unemployment_gap_calculator(rate, natural_unemployment_rate)
    unemployment_gaps.append((country, gap))
print("Potential gaps between the 2023 unemployment rates and the natural unemployment rate:")
for country, gap in unemployment_gaps:
    if gap < 0:
        print(f"The effort required for {country} is an increase of {abs(gap):.2f} percentage points")
    else:
        print(f"The effort required for {country} is an decrease of {gap:.2f} percentage points")

print()

# Question 4
print("Question 4")
# I summarize my datas
data = []

countries = ["France", "Germany", "Italy", "Netherlands", "United Kingdom"]
inflation_rate_2023 = [6.1, 6.3, 6.4, 3.2, 6.9]
unemployment_rate_2023 = [7.2, 2.9, 8.1, 3.7, 4.2]
number_of_unemployed = [x * 1000000 for x in unemployed_2023]
effort_percentages = [gap for country, gap in unemployment_gaps]
liste_arrondie = []
for element in effort_percentages:
    element_arrondi = round(element, 2)  # Arrondi à deux chiffres après la virgule
    liste_arrondie.append(element_arrondi)

effort_percentages = liste_arrondie

for i in range(len(countries)):
    country_data = {
        "Pays": countries[i],
        "Taux d'inflation": inflation_rate_2023[i],
        "Taux de chômage": unemployment_rate_2023[i],
        "Nombre de chômeurs": number_of_unemployed[i],
        "Pourcentage d'effort": effort_percentages[i]
    }
    data.append(country_data)

# printing of data for each countries
for country_data in data:
    print("Country :", country_data["Pays"])
    print("Inflation rate :", country_data["Taux d'inflation"])
    print("Unemployment rate :", country_data["Taux de chômage"])
    print("Number of unemployed :", country_data["Nombre de chômeurs"])
    print("Effort percentage :", country_data["Pourcentage d'effort"])
    print()

# concatenate effort pourcentage to section 1 lists
for i in range(len(data_lists)):
    data_lists[i].append(effort_percentages[i])
print('data list =', data_lists)


print()

# SECTION 3: ESTIMATING THE PHILLIPS CURVE
print('SECTION 3')
# In this final section, we are going to clearly mobilise the main results of our project in the form of a text document
# Question 1
print("Question 1")
# Our datas
data_with_countries = [[countries[i]] + data_lists[i] for i in range(len(data_lists))]
for item in data_with_countries:
    print(item)
print()
# Ask user to enter the country number
while True:
    try:
        numb = int(input('Please enter the code associated with your country :'))
        if 1 <= numb <= 5:
            # Find the correct effort for the numb entered
            effort = data_with_countries[numb - 1][-1]
            if effort > 0:
                print(f"The effort percentage for {data_with_countries[numb - 1][0]} is {effort} %")
                print(f"{data_with_countries[numb - 1][0]} must conduct a restrictive fiscal policy because its unemployment rate is lower than the natural unemployment rate")
            else:
                print(f"{data_with_countries[numb - 1][0]} must pursue an expansionary fiscal policy because its unemployment rate is higher than the natural unemployment rate")
            break
        else:
            print("Invalid number. Please enter a number between 1 and 5.")
    except ValueError:
        print("Invalid input. Please enter a valid number.")
print()

# Question 2
print("Question 2")
active_pop_2024 = [22, 31, 19, 16, 23]

# year N unemployed calculator
def unemployed_calculator(urateN, active_pop_N):
    unemployed_N = []
    for i in range(len(urateN)):
        ur = urateN[i]
        unemployed_millions = (ur / 100) * active_pop_N[i]
        unemployed_N.append(round(unemployed_millions, 2))
    return unemployed_N
# Calculate the number of unemployed (in millions) for 2024
unemployed_2024 = unemployed_calculator(unemployment_rate_2024, active_pop_2024)
print('unemployed_2024:', unemployed_2024)
print()

for a, b in zip(countries, unemployed_2024):
    print(f"There are {b} millions of unemployed in {a}")

# Number of unemployed people reduced
print("The percentages of effort to be made for each countries are contained in this list:", effort_percentages)
print()

# Function for calculate the effect of the fiscal policy
def reduction(UN, EFF):
    reduction_list = []
    for x, y in zip(UN, EFF):
        reduct = y * x
        reduct = round(reduct * 10000, 2)
        reduction_list.append(reduct)
    return reduction_list

# Effect of the policy based on each country
policy_gain = reduction(unemployed_2024, effort_percentages)
print('Effects for the 5 countries:', policy_gain)
print()
for i in range(len(effort_percentages)):
    if effort_percentages[i] > 0:
        print(f"In {2024}, {countries[i]} will have {unemployed_2024[i]} million unemployed. By implementing an expansionary fiscal policy, the number of fewer unemployed will be {policy_gain[i]}.")

print()

# Question 3
print("Question 3")
# Ask user to enter the country number
while True:
    try:
        numb = int(input('Please enter the code associated with your country :'))
        if 1 <= numb <= 5:
            # Find the correct effort for the numb entered
            effort = data_with_countries[numb - 1][-1]
            if effort > 0:
                print(f"The effort percentage for {data_with_countries[numb - 1][0]} is {effort}")
                print(f"{data_with_countries[numb - 1][0]} must conduct a restrictive fiscal policy because its unemployment rate is lower than the natural unemployment rate. The number of unemployed should thus rise by {policy_gain[numb - 1]}")
            else:
                print(f"{data_with_countries[numb - 1][0]} must pursue an expansionary fiscal policy because its unemployment rate is higher than the natural unemployment rate. The number of unemployed should thus fall by {policy_gain[numb - 1]}")
            break
        else:
            print("Invalid number. Please enter a number between 1 and 5.")
    except ValueError:
        print("Invalid input. Please enter a valid number.")

print()

# Question 4
print("Question 4")
# Open the file for writing
conclusion_file = open("conclusion_OCDE.txt", 'w')

# Loop through each country's data
for country_data in data:
    country_name = country_data["Pays"]
    effort_percentage = country_data["Pourcentage d'effort"]

    # restrictive or expansinary
    if effort_percentage > 0:
        policy_decision = "restrictive fiscal policy, favoring unemployment"
    else:
        policy_decision = "expansionary fiscal policy, favoring inflation"

    # Writing conclusion
    conclusion = f"{country_name}: {policy_decision}\n"
    conclusion_file.write(conclusion)
# Closing file
conclusion_file.close()
print(f"The file {conclusion_file} has been created with conclusions for each country.")
