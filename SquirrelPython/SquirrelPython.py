file = open("pythonTest.txt", "w")
ans = input("True or false?")

if ans == "true":
    file.write("true")
    file.close()
elif ans == "false":
    file.write("false")
    file.close()
else:
    file.write("null")
    file.close()

