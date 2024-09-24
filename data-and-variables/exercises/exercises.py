# 1. Declare and assign the variables here:
space_shuttle_name = 'Determination' 
shuttle_speed_mph = 17500
distance_to_mars_km = 225000000
distace_to_moon_km = 384400
MILES_PER_KM = 0.621
# 2. Use print() to print the 'type' each variable. Print one item per line.
print(type(space_shuttle_name))
print(type(shuttle_speed_mph))
print(type(distance_to_mars_km))
print(type(distace_to_moon_km))
print(type(MILES_PER_KM))
# Code your solution to exercises 3 and 4 here:
miles_to_mars = distance_to_mars_km * MILES_PER_KM
hours_to_mars = miles_to_mars / shuttle_speed_mph
days_to_mars = hours_to_mars / 24

print(miles_to_mars)
print(hours_to_mars)
print(days_to_mars)
print(space_shuttle_name + " will take " + str(days_to_mars) + " days to reach mars.")
# Code your solution to exercise 5 here
miles_to_moon = distace_to_moon_km * MILES_PER_KM
hours_to_moon = miles_to_moon / shuttle_speed_mph
days_to_moon = hours_to_moon / 24

print(miles_to_moon)
print(hours_to_moon)
print(days_to_moon)
print(space_shuttle_name + " will take " + str(days_to_moon) + " days to reach moon.")

