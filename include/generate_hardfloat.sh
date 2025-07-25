#!/bin/bash

PROJECT_DIR=$(dirname "$(dirname "$(readlink -f "$0")")")
INCLUDE_DIR="$PROJECT_DIR/include"
HARDFLOAT_DIR="$INCLUDE_DIR/HardFloat/HardFloat-1"
echo $HARDFLOAT_DIR

> "$INCLUDE_DIR/hardfloat.sv"
cat "$HARDFLOAT_DIR"/source/RISCV/*.vi >> "$INCLUDE_DIR/hardfloat.sv"
cat "$HARDFLOAT_DIR"/source/RISCV/*.v  >> "$INCLUDE_DIR/hardfloat.sv"
cat "$HARDFLOAT_DIR"/source/*.vi       >> "$INCLUDE_DIR/hardfloat.sv"
cat "$HARDFLOAT_DIR"/source/*.v        >> "$INCLUDE_DIR/hardfloat.sv"
sed 's/^`include.*vi\"//' -i              "$INCLUDE_DIR/hardfloat.sv"
sed 's/wire sqrtOpOut;//' -i              "$INCLUDE_DIR/hardfloat.sv"
