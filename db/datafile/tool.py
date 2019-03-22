import sys

def tool1():
    f = open(sys.argv[1],"r")
    cnt = 3
    for i in range(8):
        wf = open(sys.argv[2] + str(cnt),"w")
        c = 0
        for line in f:
            wf.write(line)
            c += 1
            if c == 15:
                break
        wf.close()
        cnt += 1
    f.close()

def tool2():
    f = open(sys.argv[1],"r")
    wf = open(sys.argv[2]+sys.argv[3],"w")
    for line in f:
        wf.write(line.replace("ept2","ept"+sys.argv[3]))
    f.close()
    wf.close()

tool2()