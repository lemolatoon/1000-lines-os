# 環境構築

## Ubuntu on wsl

## OpenSBI の curl

```
curl -LO https://github.com/qemu/qemu/raw/v8.0.4/pc-bios/opensbi-riscv32-generic-fw_dynamic.bin
```

## qemu の build

### qemu submodule を初期化

```
git submodule init
git submodule update --recursive
```

### qemu の build

```
sudo apt install -y pkg-config ninja-build libglib2.0 libpixman-1-dev
```

gcc-11 を使うとなぜかエラーになったので、ホストの version 9 の gcc を使うとできた。
おそらく、https://github.com/vmware/open-vm-tools/issues/509 のせい。

```
cd qemu
git checkout v8.0.4
git submodule init
git submodule --recursive
./configure --target-list=riscv32-softmmu
make -j $(nproc)
```
