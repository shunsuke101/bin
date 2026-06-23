INSTALL=~/qemu/build
IMAGE=~/riscv/ubuntu-24.04.4-preinstalled-server-riscv64_ima.img


$INSTALL/qemu-system-riscv64 \
  -machine virt -cpu rv64 -m 4G -smp 2 \
  -nographic \
  -kernel /usr/lib/u-boot/qemu-riscv64_smode/uboot.elf \
  -netdev user,id=net0,hostfwd=tcp::2222-:22 \
  -device virtio-net-device,netdev=net0 \
  -device virtio-rng-pci \
  -drive file=$IMAGE,format=raw,if=virtio \
  -chardev socket,id=chrtpm,path=/tmp/emulated_tpm/swtpm-sock \
  -tpmdev emulator,id=tpm0,chardev=chrtpm \
  -device tpm-tis-device,tpmdev=tpm0 
