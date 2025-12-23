# CS F342 – Lab 1
## Verilog Modeling Styles and Hierarchical Design

---

## 1. Objective

The objective of **Lab 1** is to introduce you to **hands-on Verilog HDL design and simulation**, building on your background in digital logic design.

In this lab, you will:

- Implement the same hardware function using different Verilog modeling styles
- Understand the relationship between structural, dataflow, and behavioral (RTL) descriptions
- Learn how hierarchical designs are built using reusable modules
- Use a Codespaces-based workflow with VS Code
- Develop good verification discipline using testbenches

This lab forms the foundation for all subsequent labs in the course.

---

## 2. Design Target

All in-lab tasks are based on a **1-bit full adder**.

For Tasks 1–3, your top-level module must have the following interface:

module dut (
  input  wire a,
  input  wire b,
  input  wire cin,
  output wire sum,
  output wire cout
);

Important:
- The top-level module must be named `dut`
- Testbenches instantiate a module named `dut` and will not work if it is renamed

---

## 3. Directory Structure (Lab 1)

labs/lab1/
- task1/dut.v
- task2/dut.v
- task3/dut.v
- task4/dut.v
- task5/dut.v   (homework)
- tb/
  - tb_fa.v
  - tb_adder4.v
  - tb_adder4_sub.v
- README.md

Additional folders:
- shared/      Reusable modules
- artefacts/   Simulation outputs (lab-wise)

Rules:
- Each task folder contains exactly one design file: dut.v
- All testbenches are stored in labs/lab1/tb/
- Generated files must not be placed inside labs/

---

## 4. Toolchain and Workflow

You will work entirely inside **GitHub Codespaces**.

Tools used:
- Icarus Verilog – compilation and simulation
- VS Code Tasks – running compile and simulation commands
- VaporView – waveform viewing (debugging only)

No local installation is required.

---

## 5. How to Compile and Simulate

When running a simulation, you must specify:
1. Lab (e.g. lab1)
2. Task (e.g. task2)
3. Testbench (e.g. tb_fa.v)

Compile:
- Open Command Palette (Ctrl+Shift+P)
- Select “Tasks: Run Task”
- Choose “Compile (lab + task + testbench)”
- Enter the required values

Run simulation:
- Run “Run (generate VCD)”
- Use the same inputs

Simulation outputs are generated in artefacts/lab1/.

Waveforms may be viewed using VaporView, but waveform screenshots are not required for submission.

---

## 6. Lab Tasks

Task 1 – Structural Modeling (Gate-Level)
Objective:
Implement a 1-bit full adder using structural (gate-level) Verilog.

Requirements:
- Use gate primitives (and, or, xor, not)
- No assign statements
- No always blocks

File:
labs/lab1/task1/dut.v

Testbench:
tb_fa.v

---

Task 2 – Dataflow Modeling
Objective:
Implement the same full adder using dataflow modeling.

Requirements:
- Use continuous assignments (assign)
- Express logic as Boolean equations
- No gate primitives
- No always blocks

File:
labs/lab1/task2/dut.v

Testbench:
tb_fa.v

---

Task 3 – Behavioral / RTL Modeling
Objective:
Implement the same full adder using behavioral modeling.

Requirements:
- Use always @(*)
- Use blocking assignments
- Ensure purely combinational behavior

File:
labs/lab1/task3/dut.v

Testbench:
tb_fa.v

---

Task 4 – Hierarchical Design (4-bit Adder)
Objective:
Build a 4-bit ripple-carry adder using reusable 1-bit full adders.

Requirements:
- Use module instantiation
- Place reusable modules in the shared/ directory
- Do not copy-paste logic

File:
labs/lab1/task4/dut.v

Testbench:
tb_adder4.v

---

Task 5 – Homework: 4-bit Adder–Subtractor
Objective:
Extend the 4-bit adder to support subtraction.

Requirements:
- sub = 0 → addition
- sub = 1 → subtraction
- Use two’s complement logic
- Reuse existing modules

File:
labs/lab1/task5/dut.v

Testbench:
tb_adder4_sub.v

---

## 7. Verification Expectations

Required:
- Clean compilation
- Correct simulation behavior
- All test cases pass

Not graded:
- Waveform screenshots
- SVG/PNG exports
- GUI artifacts

Waveforms are a debugging aid, not a submission artifact.

---

## 8. Submission Instructions

Commit the following:
1. dut.v files for all completed tasks
2. Any testbench changes only if explicitly instructed
3. This README.md updated with:
   - Tasks completed
   - Any assumptions or notes

---

## 9. Common Mistakes to Avoid

- Renaming the dut module
- Copy-pasting logic instead of reusing modules
- Modifying testbenches without permission
- Ignoring compilation warnings

---

## 10. Learning Outcome

By completing Lab 1, you should be comfortable:
- Writing Verilog at multiple abstraction levels
- Simulating and verifying combinational logic
- Building hierarchical hardware designs
- Thinking in terms of design and verification

This lab prepares you for ALU and datapath design in subsequent labs.

---
End of Lab 1
