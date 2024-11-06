import math
import string
f = open("sinerom.mem","w")
for i in range(256):
    v = int(math.cos(2*3.1416*i/256)*127+127) # v = 127cos(2πi/256) + 127
    if (i+1)%16 == 0: 
        s = "{hex:2X}\n"  # s wil be 2 characters wide
    else:
        s = "{hex:2X} "
    f.write(s.format(hex=v))

f.close()