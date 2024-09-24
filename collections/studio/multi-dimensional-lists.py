food = "water bottles,meal packs,snacks,chocolate"
equipment = "space suits,jet packs,tool belts,thermal detonators"
pets = "parrots,cats,moose,alien eggs"
sleep_aids = "blankets,pillows,eyepatches,alarm clocks"

# a) Use split to convert the strings into four cabinet lists. Alphabetize the contents of each cabinet.
cabinet_list1 = food.split(',')
cabinet_list1.sort()
cabinet_list2 = equipment.split(',')
cabinet_list2.sort()
cabinet_list3 = pets.split(',')
cabinet_list3.sort()
cabinet_list4 = sleep_aids.split(',')
cabinet_list4.sort()
print(cabinet_list1)
print(cabinet_list2)
print(cabinet_list3)
print(cabinet_list4)

# b) Initialize a cargo_hold list and add the cabinet lists to it. Print cargo_hold to verify its structure.
# copied the below list from list.py excerices
cargo_hold_temp = ['oxygen tanks', 'space suits', 'parrot', 'instruction manual', 'meal packs', 'slinky', 'security blanket']
cargo_hold=[]
cargo_hold.append(cargo_hold_temp)
cargo_hold.append(cabinet_list1)
cargo_hold.append(cabinet_list2)
cargo_hold.append(cabinet_list3)
cargo_hold.append(cabinet_list4)
#cargo_hold = cargo_hold + cabinet_list1 + cabinet_list2 + cabinet_list3 + cabinet_list4
print("Ans b:" , cargo_hold)


# c) Query the user to select a cabinet (0 - 3) in the cargo_hold.
user_selection = int(input("enter the number between 0-3:"))
print("Ans c: ", user_selection)



# d) Use bracket notation and format to display the contents of the selected cabinet. If the user entered an invalid number, print an error message.
if user_selection >= 0 and user_selection <= 3:
    print("Ans d: {0}" .format(cargo_hold[user_selection]))
else:
    print(" Ans d: invalid number entered: not between 0-3")    



# e) Modify the code to query the user for BOTH a cabinet in cargo_hold AND a particular item. Use the in method to check if the cabinet contains the selected item, then print “Cabinet ____ DOES/DOES NOT contain ____.”
cabinet_selection = int(input("enter the cabinet between 0-4:"))
print(cabinet_selection)
if cabinet_selection >= 0 and cabinet_selection <= 4:
    item_selection = int(input("enter the item number:"))
    if item_selection >= 0 and item_selection <= len(cargo_hold[cabinet_selection]):
        print("Ans e: {0}" .format(cargo_hold[cabinet_selection][item_selection]))
    else:
        print(" Ans e: invalid number entered:") 
else:
    print(" Ans e: invalid number entered: not between 0-4") 

