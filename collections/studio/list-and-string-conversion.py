proto_list1 = "3,6,9,12"
proto_list2 = "A;C;M;E"
proto_list3 = "space delimited string"
proto_list4 = "Comma-spaces, might, require, typing, caution"

strings = [proto_list1, proto_list2, proto_list3, proto_list4]

# a) Use the 'in' method to check to see if the words in each string are separated by commas (,), semicolons (;) or just spaces.
for string in strings:
    if (',' in string):
        print("this element {0} contains comma:".format(string))
    if (';' in string):
        print("this element {0} contains semicolons: ".format(string))    
    if(' ' in string):
        print("this element {0} contains space:".format(string))
 

# b) If the string uses commas to separate the words, split it into an array, reverse the entries, and then join the array into a new comma separated string.
for string in strings:
    if (',' in string):
        # Split the string based on comma delimiter
        list1 = string.split(',')
        # reverse the list
        list1.reverse()
        print ( "reversed list:" ,list1)
        # converting list into comma separated string
        print(",".join(list1))    


# c) If the string uses semicolons to separate the words, split it into an array, alphabetize the entries, and then join the array into a new comma separated string.
for string in strings:
    if (';' in string):
        # Split the string based on semicolons delimiter
        list2 = string.split(';')
        # alphabetize the entries using sort()method
        list2.sort()
        print("alphabetized list:",list2)
         # converting list into a comma separated string
        print(",".join(list2))  



# d) If the string uses spaces to separate the words, split it into an array, reverse alphabetize the entries, and then join the array into a new space separated string.
for string in strings:
    if (' ' in string):
        # Split the string based on spaces delimiter
        list3 = string.split(' ')
        # reverse alphabetize the entries using sort()method
        list3.sort(reverse=True)
        print("Reversed alphbetize list:",list3)
         # converting list into a comma separated string
        print(",".join(list3))


# e) If the string uses ‘comma spaces’ to separate the list, modify your code to produce the same result as part “b”, making sure that the extra spaces are NOT part of the final string.
for string in strings:
    if (', ' in string):
        # Split the string based on comma delimiter
        list4 = string.split(', ')
        # reverse the list
        list4.reverse()
        print("mofified list:",list4)
        # converting list into a comma separated string
        print(",".join(list4))
         