#!/usr/bin/env bash
set -e

LAB="$1"
TASK="$2"
TB="$3"

if [ -z "$LAB" ] || [ -z "$TASK" ] || [ -z "$TB" ]; then
  echo "Usage: compile.sh <lab> <task> <testbench>"
  echo "Example: compile.sh lab1 task2 tb_fa.v"
  exit 1
fi

LAB_DIR="labs/${LAB}"
TASK_DIR="${LAB_DIR}/${TASK}"
TB_FILE="${LAB_DIR}/tb/${TB}"
DUT_FILE="${TASK_DIR}/dut.v"
ARTEFACT_DIR="artefacts/${LAB}"

# Sanity checks
if [ ! -d "$LAB_DIR" ]; then
  echo "Error: lab not found: $LAB_DIR"
  exit 1
fi

if [ ! -d "$TASK_DIR" ]; then
  echo "Error: task not found: $TASK_DIR"
  exit 1
fi

if [ ! -f "$DUT_FILE" ]; then
  echo "Error: dut.v not found in $TASK_DIR"
  exit 1
fi

if [ ! -f "$TB_FILE" ]; then
  echo "Error: testbench not found: $TB_FILE"
  echo "Available testbenches:"
  ls "$LAB_DIR/tb"
  exit 1
fi

mkdir -p "$ARTEFACT_DIR"

OUT_SIM="${ARTEFACT_DIR}/${TASK}_${TB%.v}.sim"

iverilog -g2012 -Wall \
  -o "$OUT_SIM" \
  shared/*.v \
  "$DUT_FILE" \
  "$TB_FILE"

echo "✔ Compiled:"
echo "  $OUT_SIM"
