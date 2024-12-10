
README
Automated RMSD Calculation in VMD
Purpose
This script automates the calculation of Root Mean Square Deviation (RMSD) for protein systems and nucleic acids using VMD (Visual Molecular Dynamics). It computes RMSD for specific structural regions over the trajectory of molecular dynamics simulations. The script is designed to handle multiple mutants in a systematic manner.

Key Features
Automated TCL Script Generation:

Dynamically generates VMD-compatible TCL scripts for each mutant.
RMSD Computation:

Calculates RMSD for:
Entire protein backbone.
Nucleic acid backbone (optional).
N-terminal region (residues 1–75 by default).
C-terminal region (residues 80–229 by default).
Output Files:

RMSD values are saved as text files for downstream analysis.
Customizable Residue Ranges:

Easily adapt residue ranges for N-terminal and C-terminal based on your system.
System Requirements
Software:

VMD (https://www.ks.uiuc.edu/Research/vmd/).
Input Files:

Soluteonly.gro: Structure file (GROMACS format).
prod-[MUT]-400ns-nopbc-notwat.xtc: Trajectory file (GROMACS format).
File Organization:
Each mutant's data should be placed in a separate directory named after the mutant (e.g., M188I, A97V).

How to Execute the Script
Step 1: Setup Input Files
Place the script in the root directory containing subdirectories for each mutant.
Ensure that each mutant's directory includes:
Soluteonly.gro
prod-[MUT]-400ns-nopbc-notwat.xtc
Step 2: Customize Residue Ranges (Optional)
If your N-terminal or C-terminal residue ranges differ:
Update the residue ranges in the script:
N-terminal: resid 1 to 75.
C-terminal: resid 80 to 229.
Step 3: Run the Script
Execute the script by running:

bash
Copy code
bash script_name.sh  
Step 4: Analyze the Outputs
For each mutant, the script generates:

RMSD Output Files:

mut-proteinBBrmsd.txt: RMSD of the whole protein backbone.
mut-nucleicBBrmsd.txt: RMSD of the nucleic acid backbone (if present).
mut-Nterm-proteinBBrmsd.txt: RMSD of the N-terminal backbone.
mut-Cterm-proteinBBrmsd.txt: RMSD of the C-terminal backbone.
Log Files:

Execution logs are stored in mut.log for debugging and validation.
Detailed Explanation of RMSD Calculations
1. Whole Protein Backbone
Purpose: Evaluates the overall structural stability of the protein during the simulation.
Selection: protein and backbone and noh.
2. Nucleic Acid Backbone (Optional)
Purpose: Monitors the conformational changes of DNA/RNA, if applicable.
Selection: nucleic and backbone and noh.
3. N-terminal Backbone
Purpose: Analyzes the stability of the N-terminal region, often associated with functional domains.
Default Residues: resid 1 to 75.
4. C-terminal Backbone
Purpose: Examines the stability of the C-terminal region, typically involved in allosteric regulation or binding.
Default Residues: resid 80 to 229.
Customizing the Script
File Names:

Update .gro and .xtc file names if they differ from defaults.
Residue Ranges:

Modify residue ranges for N-terminal and C-terminal calculations to reflect your system's structure.
Skipping DNA Calculations:

If your system lacks nucleic acids, comment out or remove the DNA-specific RMSD block.
Troubleshooting
Common Issues:
Missing Input Files:

Ensure .gro and .xtc files exist in each mutant's directory and are correctly named.
Invalid Residue Selection:

Verify that the selected residues (e.g., resid 1 to 75) are valid for your structure.
Errors in VMD:

Check the generated TCL script and mut.log for detailed error messages.
Validation:
Confirm RMSD calculations by comparing values across frames.
Ensure the reference frame (frame 0) represents the correct starting structure.