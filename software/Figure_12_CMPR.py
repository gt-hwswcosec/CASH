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
from ProductRegisters.Cryptanalysis.Components.EquationGenerators import CubeEqGenerator
from ProductRegisters.Cryptanalysis.utils import get_var_map

# Other
import matplotlib.pyplot as plt

# MPR and CMPR instantiation
M7 = MPR(7, poly("1 + x + x^7"), poly("1 + x^5"))

M5 = MPR(5, poly("1 + x^2 + x^5"), poly("1 + x + x^4"))

M3 = MPR(3, poly("1 + x + x^3"), poly("1 + x^2"))

M2 = MPR(2, poly("1 + x + x^2"), poly("1 + x"))

C = CMPR([M7,M5,M3,M2])

C.generateChaining(template=old_ANF_template(max_and=4,max_xor=4))

C.compile()

num_cycles = 35
output_function = VAR(0)
monomial_profile = output_function.eval_ANF(C.monomial_profiles())

var_map = get_var_map(
    feedback_fn = C,
    monomial_profile = monomial_profile,
    variable_blocks = C.blocks,
    include_variables = True,
    complete_subsets = True,
    lexicographic = True
)

degrees = [0]*len(var_map.items())

for term, idx in var_map.items():
    degrees[idx] = len(term)

cycle_nums = []
monomial_counts = []
monomial_degrees = []

for i, anf, const in CubeEqGenerator(
    feedback_fn = C,
    output_fn = output_function,
    var_map = var_map,
    limit = num_cycles,
    verbose = False
):
    if i > 0 and i <= num_cycles:
        count = np.sum(anf)
        degree = np.max(degrees * anf)

        cycle_nums.append(i)
        monomial_counts.append(count)
        monomial_degrees.append(degree)

        print(f"Cycle: {i} / {num_cycles} No. of Monomials {count}")
        print(f"Degree at Cycle {i}: {degree}")

# ----------------------------
# Font size configuration
# ----------------------------
TITLE_FS = 22
LABEL_FS = 20
TICK_FS = 18

# ---------------------------------------------------------
# Scatter Plot 1: Monomial Count vs Cycle
# ---------------------------------------------------------
plt.figure(figsize=(10, 6))
plt.scatter(
    cycle_nums,
    monomial_counts,
    s=40,
    alpha=0.7
)

plt.title("Monomial Count per Cycle", fontsize=TITLE_FS)
plt.xlabel("Clock Cycle", fontsize=LABEL_FS)
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
    cycle_nums,
    monomial_degrees,
    s=40,
    alpha=0.7,
    color='orange'
)

plt.title("Monomial Degree per Cycle", fontsize=TITLE_FS)
plt.xlabel("Clock Cycle", fontsize=LABEL_FS)
plt.ylabel("Monomial Degree", fontsize=LABEL_FS)

plt.xticks(fontsize=TICK_FS)
plt.yticks(fontsize=TICK_FS)

plt.grid(True)
plt.tight_layout()
plt.show()



print(f"Finished!")
