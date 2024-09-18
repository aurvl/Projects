# SECTION 1: DATA ARRANGEMENT

print('SECTION 1')

# Define a dictionary to represent countries
country = {
    1: 'France',
    2: 'Germany',
    3: 'Italy',
    4: 'Netherlands',
    5: 'United Kingdom'
}
print(country)

print('\n')

# Define inflation and unemployment rates for each country
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

print('\n')

# Combine data into a list of lists
data_lists = [france_data, germany_data, italy_data, netherlands_data, uk_data]
print('data list =', data_lists)
active_pop_2023 = [19, 32, 17, 16, 22]

# Function to calculate the number of unemployed (in millions) for each country in 2023
def calculate_unemployed(data_lists, active_pop_2023):
    unemployed = []
    for i in range(len(data_lists)):
        unemployment_rate = data_lists[i][1]  # Get the unemployment rate from the data
        unemployed_millions = (unemployment_rate / 100) * active_pop_2023[i]
        unemployed.append(round(unemployed_millions, 2))
    return unemployed

# Calculate the number of unemployed (in millions) for each country
unemployed_2023 = calculate_unemployed(data_lists, active_pop_2023)

# Append the unemployment data to the existing lists
for i in range(len(data_lists)):
    data_lists[i].append(unemployed_2023[i])

# Print the updated lists with unemployment data
for i, country_data in enumerate(data_lists):
    countries = ["France", "Germany", "Italy", "Netherlands", "United Kingdom"][i]
    print(countries, "Inflation, unemployment rates and Unemployed in millions:", country_data)

print('\n')

# SECTION 2: ESTIMATING THE PHILLIPS CURVE

print('SECTION 2')

# Define the inflation and unemployment rates for each country for 2024
inflation_rate_2024 = [3.1, 3.0, 3.0, 2.2, 2.8]
unemployment_rate_2024 = [7.2, 2.8, 8.1, 4.0, 4.5]

# Function to calculate the average of a list of values
def calculate_average(values):
    if len(values) == 0:
        return 0  # Handle the case where the list is empty
    total = sum(values)
    return total / len(values)

# Calculate average inflation and unemployment rates
average_inflation = calculate_average(inflation_rate_2024)
average_unemployment = calculate_average(unemployment_rate_2024)

# Create the OECD list with average values
OECD = [average_inflation, average_unemployment]

# Print average values and OECD list
print("Average Inflation Rate:", average_inflation)
print("Average Unemployment Rate:", average_unemployment)
print("OECD List (Average Inflation, Average Unemployment):", OECD)

print('\n')

# Calculate the OLS estimator and the intercept (Z) for the Phillips curve
sum1 = 0
for i, j in zip(inflation_rate_2024, unemployment_rate_2024):
    sum_of_product = (i - average_inflation) * (j - average_unemployment)
    sum1 += sum_of_product

sum2 = 0
for i in unemployment_rate_2024:
    sum_of_differences_unemployment = (i - average_unemployment) ** 2
    sum2 += sum_of_differences_unemployment 

alpha = sum1 / sum2
alpha = round(alpha, 2)
print("The OLS estimator of our regression is:", alpha)

# Calculate the intercept of the model (Z)
Z = average_inflation - alpha * average_unemployment
Z = round(Z, 2)
print("The intercept of the model Z (reservation wage) is:", Z)

# Display the Phillips curve model
print("The model is: ∆π =", Z, " + ", alpha, " * ∆U")

print('\n')

# Calculate the unemployment gap for each country
unemployment_rate_2023 = [7.2, 2.9, 8.1, 3.7, 4.2]
natural_unemployment_rate = 5
countries = ["France", "Germany", "Italy", "Netherlands", "United Kingdom"]

# Function to compute the unemployment gap
def unemployment_gap_calculator(u_rate, natural_unemployment_rate):
    return u_rate - natural_unemployment_rate

# Calculate gaps and print results
unemployment_gaps = []
for rate, country in zip(unemployment_rate_2023, countries):
    gap = unemployment_gap_calculator(rate, natural_unemployment_rate)
    unemployment_gaps.append((country, gap))
print("Potential gaps between the 2023 unemployment rates and the natural unemployment rate:")
for country, gap in unemployment_gaps:
    if gap < 0:
        print(f"The effort required for {country} is an increase of {abs(gap):.2f} percentage points")
    else:
        print(f"The effort required for {country} is a decrease of {gap:.2f} percentage points")

print('\n')

# Summarize data for each country
print("Summary of data for each country")
data = []

countries = ["France", "Germany", "Italy", "Netherlands", "United Kingdom"]
inflation_rate_2023 = [6.1, 6.3, 6.4, 3.2, 6.9]
unemployment_rate_2023 = [7.2, 2.9, 8.1, 3.7, 4.2]
number_of_unemployed = [x * 1000000 for x in unemployed_2023]
effort_percentages = [gap for country, gap in unemployment_gaps]
liste_arrondie = []
for element in effort_percentages:
    element_arrondi = round(element, 2)
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

# Printing summarized data
for country_data in data:
    print("Country :", country_data["Pays"])
    print("Inflation rate :", country_data["Taux d'inflation"])
    print("Unemployment rate :", country_data["Taux de chômage"])
    print("Number of unemployed :", country_data["Nombre de chômeurs"])
    print("Effort percentage :", country_data["Pourcentage d'effort"])
    print()

# Append effort percentages to the data list
for i in range(len(data_lists)):
    data_lists[i].append(effort_percentages[i])
print('data list =', data_lists)

print('\n')

# SECTION 3: ESTIMATING THE PHILLIPS CURVE

print('SECTION 3')

# Compile data for output
data_with_countries = [[countries[i]] + data_lists[i] for i in range(len(data_lists))]
for item in data_with_countries:
    print(item)

print('\n')

# User input to display effort percentage for a selected country
while True:
    try:
        numb = int(input('Please enter the code associated with your country :'))
        if 1 <= numb <= 5:
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

print('\n')

# Calculate the number of unemployed people for 2024 and print results
active_pop_2024 = [22, 31, 19, 16, 23]

def unemployed_calculator(urateN, active_pop_N):
    unemployed_N = []
    for i in range(len(urateN)):
        ur = urateN[i]
        unemployed_millions = (ur / 100) * active_pop_N[i]
        unemployed_N.append(round(unemployed_millions, 2))
    return unemployed_N

unemployed_2024 = unemployed_calculator(unemployment_rate_2024, active_pop_2024)
print('unemployed_2024:', unemployed_2024)

print('\n')

for a, b in zip(countries, unemployed_2024):
    print(f"There are {b} millions of unemployed in {a}")

# Calculate and print policy effects
def reduction(UN, EFF):
    reduction_list = []
    for x, y in zip(UN, EFF):
        reduct = y * x
        reduct = round(reduct * 10000, 2)
        reduction_list.append(reduct)
    return reduction_list

policy_gain = reduction(unemployed_2024, effort_percentages)
print('Effects for the 5 countries:', policy_gain)

print('\n')

# Print the effect of policy for each country
for i in range(len(effort_percentages)):
    if effort_percentages[i] > 0:
        print(f"In {2024}, {countries[i]} will have {unemployed_2024[i]} million unemployed. By implementing an expansionary fiscal policy, the number of fewer unemployed will be {policy_gain[i]}.")
    else:
        print(f"In {2024}, {countries[i]} will have {unemployed_2024[i]} million unemployed. By implementing a restrictive fiscal policy, the number of fewer unemployed will be {policy_gain[i]}.")

print('\n')

# Generate a summary file with policy recommendations
print("Generating summary file with policy recommendations...")
conclusion_file = open("conclusion_OCDE.txt", 'w')

# Write policy recommendations based on effort percentages
for country_data in data:
    country_name = country_data["Pays"]
    effort_percentage = country_data["Pourcentage d'effort"]

    # Determine the fiscal policy based on the effort percentage
    if effort_percentage > 0:
        policy_decision = "restrictive fiscal policy, favoring unemployment"
    else:
        policy_decision = "expansionary fiscal policy, favoring inflation"

    # Write the conclusion to the file
    conclusion = f"{country_name}: {policy_decision}\n"
    conclusion_file.write(conclusion)

# Close the file
conclusion_file.close()
print(f"The file 'conclusion_OCDE.txt' has been created with conclusions for each country.")
