# (c) 2025 Georgia Institute of Technology
# This code is licensed under the MIT license (see LICENSE for details)

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
from ProductRegisters.Cryptanalysis.utility import *

#Other:
import matplotlib.pyplot as plt

# Helper Functions

def num_monomials(anf):
    return len(anf.args)

def degree(anf):
    deg = 0
    for term in anf.args:
        if type(term) != CONST:
            deg = max(deg,len(term.args))
    return deg

num_cycles = 35
degrees = []
num_mons = []

f = XOR(VAR(0), VAR(1), AND(VAR(7), VAR(10)), AND(VAR(9), VAR(15)))

C17 = Fibonacci(17,[])
C17[-1].add_arguments(f)

for i,anfs in enumerate(C17.anf_iterator(num_cycles,bits = [0])):
    if i == 0:
        continue

    print(f"Clock {i} -- Number of Monomials: {num_monomials(anfs[0])}, Degree: {degree(anfs[0])}")
    degrees.append(degree(anfs[0]))
    num_mons.append(num_monomials(anfs[0]))

# ----------------------------
# Font size configuration
# ----------------------------
TITLE_FS = 18
LABEL_FS = 16
TICK_FS = 14

# ---------------------------------------------------------
# Scatter Plot 1: Monomial Count vs Cycle
# ---------------------------------------------------------
plt.figure(figsize=(10, 6))
plt.scatter(
    range(1, len(num_mons) + 1),
    num_mons,
    s=40,
    alpha=0.7
)

plt.title("Monomial Count per Cycle", fontsize=TITLE_FS)
plt.xlabel("Cycle Number", fontsize=LABEL_FS)
plt.ylabel("Number of Monomials", fontsize=LABEL_FS)

plt.xticks(fontsize=TICK_FS)
plt.yticks(fontsize=TICK_FS)

plt.grid(True)
plt.tight_layout()
plt.show()

# ---------------------------------------------------------
# Scatter Plot 2: Monomial Degree vs Cycle
# ---------------------------------------------------------
plt.figure(figsize=(10, 6))
plt.scatter(
    range(1, len(degrees) + 1),
    degrees,
    s=40,
    alpha=0.7,
    color='orange'
)

plt.title("Monomial Degree per Cycle", fontsize=TITLE_FS)
plt.xlabel("Cycle Number", fontsize=LABEL_FS)
plt.ylabel("Monomial Degree", fontsize=LABEL_FS)

plt.xticks(fontsize=TICK_FS)
plt.yticks(fontsize=TICK_FS)

plt.grid(True)
plt.tight_layout()
plt.show()
   
