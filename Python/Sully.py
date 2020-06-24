import os
import sys

def sully():
    try:
        x=5
        if 'Sully_'+str(x)+'.py' in __file__: x -= 1
        filename="Sully_"+str(x)+".py"
        clone='import os%cimport sys%c%cdef sully():%c    try:%c        x=%d%c        if \'Sully_\'+str(x)+\'.py\' in __file__: x -= 1%c        filename="Sully_"+str(x)+".py"%c        clone=%r%c        with open(filename, "w") as child:%c            child.write(clone %% (10,10,10,10,10,x,10,10,10,clone,10,10,10,10,10,10,10,10,10))%c        if x < 1:%c            return%c        os.system(\'python3 \' + filename)%c    except:%c        return%csully()%c'
        with open(filename, "w") as child:
            child.write(clone % (10,10,10,10,10,x,10,10,10,clone,10,10,10,10,10,10,10,10,10))
        if x < 1:
            return
        os.system('python3 ' + filename)
    except:
        return
sully()
