a = 3
a += 5

print(a)

with open('/root/result.txt', 'w') as file:
    file.write(str(a))