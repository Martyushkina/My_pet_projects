#стек с поддержкой максимума
n = int(input())
stack = []
stackmx = []

for i in range(n):
    com = input().split()
    if com[0] == 'max':
        if any(stackmx):
            print(stackmx[-1])
    elif com[0] == 'pop':
        if any(stackmx):
            del stackmx[-1]
            del stack[-1]
    elif com[0] == 'push':
        stack.append(int(com[1]))
        if any(stackmx):
            stackmx.append(max(int(com[1]), stackmx[-1]))
        else:
            stackmx.append(int(com[1]))


    
