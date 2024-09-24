my_string = "LaunchCode"


# a) Use string methods to remove the first three characters from the string and add them to the end.

new_string = my_string[3:10] + my_string[0:3]
print(new_string)

# Use a template literal to print the original and modified string in a descriptive phrase.

print(f"original string was {my_string} and the modified sting is {new_string}")

# b) Modify your code to accept user input. Query the user to enter the number of letters that will be relocated.
my_string = input("your code:")
number_of_letters = int(input("enter the number of letters to be replaced:"))
new_string = my_string[number_of_letters:] + my_string[:number_of_letters]
print(new_string)
#your_code = input("enter the number of letters:")



# c) Add validation to your code to deal with user inputs that are longer than the word. In such cases, default to moving 3 characters. Also, the template literal should note the error.
my_string = input("your code:")
number_of_letters = int(input("enter the number of letters to be replaced:"))
if number_of_letters > len(my_string):
    new_string = my_string[3:] + my_string[:3]
    print(f" The number of letters to be replaced {number_of_letters} is greater than the length of {my_string}")
    print(f"Replaced String: {new_string}")
else: 
  new_string = my_string[number_of_letters:] + my_string[:number_of_letters]
  print(new_string)