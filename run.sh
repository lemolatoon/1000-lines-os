#!/bin/bash
set -xue

QEMU=./qemu/build/qemu-system-riscv32
CC=clang-16
CFLAGS="-std=c11 -O2 -g3 -Wall -Wextra --target=riscv32 -ffreestanding -nostdlib -mno-relax"

$CC $CFLAGS -Wl,-Tkernel.ld -Wl,-Map=kernel.map -o kernel.elf kernel.c

$QEMU -machine virt -bios default -nographic -serial mon:stdio --no-reboot -kernel kernel.elf