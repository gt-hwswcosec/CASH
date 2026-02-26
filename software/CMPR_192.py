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

# 0xD01886D8C4AF15F9B3BC8D34F5CD5904 as a binary list, reverse for LSB -> MSB order
key = [1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 1, 0, 0, 1, 0, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 1, 0, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 0, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 1, 0, 1, 0, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0]
key.reverse()

M107 = MPR(107, poly("x^107 + x^59 + x^54 + x^39 + 1"), [0,1] + key[:105])

M61 = MPR(61, poly("1 + x^15 + x^19 + x^44 + x^61"), [0, 1] + [0]*36 + key[-23:])

M19 = MPR(19, poly("1 + x + x^2 + x^5 + x^19"), poly("x^17 + 1"))

M3 = MPR(3, poly("1 + x + x^3"), poly("x^2 + x"))

M2 = MPR(2, poly("1 + x + x^2"), poly("x+1"))

C192 = CMPR([M107, M61, M19, M3, M2])
C192.generateChaining(template=prob_ANF_template(max_and=4, max_xor=4, p = 0.5))
F = FeedbackRegister([1]*192, C192)
F.to_file("C192_stored.json")
