n=int(input("Enter the number of lines: "))
code={}
for i in range(n):
    l=input().split(' ')
    if(l[0] not in code.keys()):
        code[l[0]]=l[2:]

deletekey=[]
tkd={}
for i in code:
    tkey=i
    tcon=code[i]
    if(i not in deletekey):
        for j in code:
            if(i!=j and tcon==code[j]):
                deletekey.append(j)
                tkd[j]=i            

for i in deletekey:
    del code[i]

for i in code:
    tcon=code[i]
    for j in range(len(tcon)):
        if(tcon[j] in deletekey):
            tcon[j]=tkd[tcon[j]]
print()
print("Optimized three address code is:")
for i in code:
    print(i,"="," ".join(code[i]))

