import os
import sys

VERBOSE=False
def vprint(arg1):
    """Verbose print

    :arg1: TODO
    :returns: TODO

    """
    if VERBOSE:
        print(arg1)

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
            if (self.option in readline) :
                vprint(self.option)
                vprint(readline)
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

class ManyOneLiners(object):

    """Like OneLiner but with many one liners """

    def __init__(self, options, comment="", auto_run=True ):
        self.options = options
        self.comment = comment 
        self.auto_run = auto_run
        self.getOneLiners()
        if self.auto_run:
            self.run()
        
    def getOneLiners(self):
        if not type(self.options) is list:
            raise Exception("Options must be a list of commands")
            sys.exit(1)
        else:
            oneLiners = []
            for (j,option) in enumerate(self.options):
                if j==0:
                    oneLiner = OneLiner(option, self.comment, self.auto_run)
                else:
                    oneLiner = OneLiner(option, comment="", auto_run=self.auto_run)
                oneLiners.append(oneLiner)
            self.oneLiners = oneLiners
    def checkIfExists(self):
        for oneLiner in self.oneLiners:
            if oneLiner.checkIfExists():
                return True
        return False
    def write(self):
        for oneLiner in self.oneLiners:
            oneLiner.write()
    def run(self):
        if not self.checkIfExists():
            self.write()
        else: 
            print(" ManyOneLiners with command \v \t ---> %s \n already exists. \n" %self.options)
