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

class CodeLine(object):

    """This is the main class for lines of code in the vimrc"""

    def __init__(self, line, auto_run):
        """TODO: to be defined1.

        :auto_run: TODO
        :line: TODO

        """
        self._line = line
        self._auto_run = auto_run
        if self._auto_run:
            self.run()
    def toWrite(self, arg1):
        """TODO: Docstring for toWrite.

        :arg1: TODO
        :returns: TODO

        """
        pass
    def getVIMRC(self, mode="a+"):
        """ 
            Returns file descriptor for the vim configuration file
        """
        try:
            fd = open(MYVIMRC, mode)
        except IOError, e: 
            raise IOError(e)
            sys.exit(1)
        else:
            return fd
    def checkIfExists(self):
        vimfd = self.getVIMRC(mode="r")
        line = vimfd.readline()
        while line:
            line = vimfd.readline()
            if (self._line in line) :
                vprint("LINE = "+self._line)
                vprint("FILE= "+line)
                vimfd.close()
                return True
        return False
    def write(self):
        fd = self.getVIMRC()
        fd.write(self._line)
        fd.write("\n"*2)
        fd.close()
    def run(self):
        if not self.checkIfExists():
            self.write()
        else: 
            print("Line with command \v \t ---> %s \n already exists. \n" %self._line)
        
class OneLiner(CodeLine):
    def __init__(self, option, comment="", auto_run=True):
        self.auto_run = auto_run
        self.option = option
        self.comment = comment
        # We call the initialization of OneLiner here because of auto_run
        super(OneLiner, self).__init__(option, auto_run)
    def write(self):
        # Override super write method
        fd = self.getVIMRC()
        comment = self.comment
        if comment:
            if not comment[0]=="\"":
                comment = "\"" + comment
            fd.write(comment)
            fd.write("\n")
        fd.write(self.option)
        fd.write("\n"*2)
        fd.close()
        
class Comment(CodeLine):

    """Comments"""

    def __init__(self, comment):
        CodeLine.__init__(self, comment)

        

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
