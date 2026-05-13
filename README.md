Hi! Thanks for checking out XIX❤️❤️👍👍👍
Here I'll explain how to compile. I'm not sure if it works because I haven't tested it, but this is how it is.
IT MUST BE DONE ON FreeBSD
AMD64

 sudo rm -rf /usr/src
sudo git clone https://github.com/xix-official/XIX-os /usr/src

cd /usr/src
sudo make -j4 buildworld

cd /usr/src
sudo make -j4 buildkernel KERNCONF=XIXCONFAMD64

cd /usr/src
sudo make release

FINAL ISO: /usr/obj/usr/src/release/

QEMU (Optional): qemu-system-x86_64 -cdrom XIX-OS.iso -m 4G


ARM64

cd /usr/src
sudo make -j4 TARGET=arm64 TARGET_ARCH=aarch64 buildworld

cd /usr/src
sudo make -j4 TARGET=arm64 TARGET_ARCH=aarch64 buildkernel KERNCONF=XIXCONFARM64

cd /usr/src
sudo make TARGET=arm64 TARGET_ARCH=aarch64 release

ARM

cd /usr/src
sudo make -j4 TARGET=arm TARGET_ARCH=armv7 buildworld

cd /usr/src
sudo make -j4 TARGET=arm TARGET_ARCH=armv7 buildkernel KERNCONF=XIXCONFARM

cd /usr/src
sudo make TARGET=arm TARGET_ARCH=armv7 release

RISC64

cd /usr/src
sudo make -j4 TARGET=riscv TARGET_ARCH=riscv64 buildworld

cd /usr/src
sudo make -j4 TARGET=riscv TARGET_ARCH=riscv64 buildkernel KERNCONF=XIXCONFRISCV32

cd /usr/src
sudo make TARGET=riscv TARGET_ARCH=riscv64 release

This project uses several licenses depending on the origin and authorship of the code:

BSD License — applies to code inherited from the original project and must be preserved in its entirety.

MIT License (see LICENCE-XIX.md) — applies to all new code I create for this project.

CC0 1.0 — applies only to files or modules explicitly marked as public domain.

Each file in the repository indicates its specific license in its header.

See LICENCE-XIX.md for the terms applied to new code under the MIT license.