import os
import sys


#Change this line if your vim config file is different
MYVIMRC=os.path.expanduser("~/.vimrc")

class OneLiner(object):
    def __init__(self, option, comment="", auto_run=True):
        self.auto_run = auto_run
        self.option = option
        self.comment = comment
        if self.auto_run:
            self.run()

    def getVIMRC(self):
        """ 
            Returns file descriptor for the vim configuration file
        """
        try:
            fd = open(MYVIMRC, "a+")
        except IOError, e: 
            raise IOError(e)
            sys.exit(1)
        else:
            return fd



    def checkIfExists(self):
        vimfd = self.getVIMRC()
        readline = True
        while (readline):
            readline = vimfd.readline()
            if (self.option in readline) or (readline in self.option):
                vimfd.close()
                return True
        vimfd.close()
        return False
    
    def write(self):
        fd = self.getVIMRC()
        comment = self.comment
        if comment:
            if not comment[0]=="\"":
                comment = "\"" + comment
            fd.write(comment)
            fd.write("\n")
        fd.write(self.option)
        fd.write("\n")
        fd.close()



    def run(self):
        if not self.checkIfExists():
            self.write()
        else: 
            print("OneLiner with command \v \t ---> %s \n already exists. \n" %self.option)

        


        
