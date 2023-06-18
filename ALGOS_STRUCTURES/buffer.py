#обработчик сетевых пакетов в порядке поступления
size, n = input().split()
size = int(size)
n = int(n)
buffer = []
timestart = 0
timefinish = 0
answer = []
for i in range(n):
    pack = input().split()

    if len(buffer) > size:
        answer.append(-1)
    elif len(buffer) < size:
        if timefinish < int(pack[0]):
            timefinish = int(pack[0])
        timestart = timefinish
        timefinish += int(pack[1])
        pack[0] = timestart
        pack[1] = timefinish
        buffer.append(pack)
        answer.append(timestart)
    elif len(buffer) == size and size != 0:
        if buffer[0][1] > int(pack[0]):
            answer.append(-1)
        else:
            del buffer[0]
            if timefinish < int(pack[0]):
                timefinish = int(pack[0])
            timestart = timefinish
            timefinish += int(pack[1])
            pack[0] = timestart
            pack[1] = timefinish
            buffer.append(pack)
            answer.append(timestart)

for i in answer:
    print(i)
