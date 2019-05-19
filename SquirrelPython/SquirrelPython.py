file1 = open("everything.txt", "a")

while True:
    ans = input("Pick an animal")
    file1.close()
    file1 = open("everything.txt", "w")
    file1.close()
    file1 = open("everything.txt", "a")
    
    if ans == "turtle":
        file1.write("true\n")
    else:
        file1.write("false\n")
    if ans == "fish":
        file1.write("true\n")
    else:
        file1.write("false\n")
    if ans == "dog":
        file1.write("true\n")
    else:
        file1.write("false\n")
    if ans == "horse":
        file1.write("true\n")
    else:
        file1.write("false\n")
    if ans == "wolf":
        file1.write("true")
    else:
        file1.write("false")
    if ans == "break":
        file1.close()
        break
    file1.close()
