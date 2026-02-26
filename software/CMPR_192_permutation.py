# Basic constructs:
from ProductRegisters.FeedbackRegister import FeedbackRegister
from ProductRegisters.FeedbackFunctions import *

# Boolean logic and chaining templates
from ProductRegisters.BooleanLogic import *
from ProductRegisters.BooleanLogic.ChainingGeneration.Templates import *
import ProductRegisters.BooleanLogic.ChainingGeneration.TemplateBuilding

# Berlekamp-Massey and variants
from ProductRegisters.Tools.RegisterSynthesis.lfsrSynthesis import *
from ProductRegisters.Tools.RegisterSynthesis.fcsrSynthesis import *
from ProductRegisters.Tools.RegisterSynthesis.nlfsrSynthesis import *

# Tools and other extraneous files
import ProductRegisters.Tools.ResolventSolving as ResolventSolving
from ProductRegisters.Tools.RootCounting.MonomialProfile import *

# Cryptanalysis:
from ProductRegisters.Cryptanalysis.Attacks.cube_attacks import *
from ProductRegisters.Cryptanalysis.utility import *

F = FeedbackRegister.from_file('C192_stored.json')
F.fn.compile()

def cash_permutation(input):
    initstate = str2list(input)

    if (len(input) != 128):
        print("Input must be 128 bits.")
        quit()
        
    if (any(x != '0' and x != '1' for x in input)):
        print("Input must be in binary format (base 2).")
        quit()
        
    F.seed(initstate + [1]*64)
    F.reset()
    
    for _ in range(8):
        F.clock_compiled()
    
    swap_state(F)
    
    for _ in range(8):
        F.clock_compiled()
    
    swap_state(F)
    
    for _ in range(8):
        F.clock_compiled()
        
    swap_state(F) 
    
    for _ in range(8):
        F.clock_compiled()
        
    output = str(F)
    
    return output

filein = open('./inputs.txt', 'r')
fileout = open('./outputs.txt', 'w')
lines = filein.readlines()
j = 1
for line in lines:
    input = line.strip()
    output = cash_permutation(input)
    fileout.write(output + '\n')
    print("Output #" + str(j) + " generated.")
    j += 1
