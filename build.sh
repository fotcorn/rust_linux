#!/bin/bash
DIR=`pwd`
cd /usr/src/linux-headers-3.2.0-74-generic
test -e include/generated/autoconf.h -a -e include/config/auto.conf || (		\
	echo;								\
	echo "  ERROR: Kernel configuration is invalid.";		\
	echo "         include/generated/autoconf.h or include/config/auto.conf are missing.";\
	echo "         Run 'make oldconfig && make prepare' on kernel src to fix it.";	\
	echo;								\
	/bin/false)

mkdir -p /home/corn/projekte/rust_linux/.tmp_versions ; rm -f /home/corn/projekte/rust_linux/.tmp_versions/*

gcc -Wp,-MD,/home/corn/projekte/rust_linux/.hello-main.o.d  -nostdinc -isystem /usr/lib/gcc/x86_64-linux-gnu/4.6/include  -I/usr/src/linux-headers-3.2.0-74-generic/arch/x86/include -Iarch/x86/include/generated -Iinclude  -include /usr/src/linux-headers-3.2.0-74-generic/include/linux/kconfig.h -Iubuntu/include  -D__KERNEL__ -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-format-security -fno-delete-null-pointer-checks -O2 -m64 -mtune=generic -mno-red-zone -mcmodel=kernel -funit-at-a-time -maccumulate-outgoing-args -fstack-protector -DCONFIG_AS_CFI=1 -DCONFIG_AS_CFI_SIGNAL_FRAME=1 -DCONFIG_AS_CFI_SECTIONS=1 -DCONFIG_AS_FXSAVEQ=1 -pipe -Wno-sign-compare -fno-asynchronous-unwind-tables -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -Wframe-larger-than=1024 -Wno-unused-but-set-variable -fno-omit-frame-pointer -fno-optimize-sibling-calls -fno-var-tracking-assignments -pg -Wdeclaration-after-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_ASM_GOTO  -DMODULE  -D"KBUILD_STR(s)=#s" -D"KBUILD_BASENAME=KBUILD_STR(hello_main)"  -D"KBUILD_MODNAME=KBUILD_STR(hello_main)" -c -o /home/corn/projekte/rust_linux/.tmp_hello-main.o /home/corn/projekte/rust_linux/hello-main.c

mv $DIR/.tmp_hello-main.o $DIR/hello-main.o

(cat /dev/null;   echo kernel//home/corn/projekte/rust_linux/hello-main.ko;) > /home/corn/projekte/rust_linux/modules.order

scripts/mod/modpost -m -a -i /usr/src/linux-headers-3.2.0-74-generic/Module.symvers -I /home/corn/projekte/rust_linux/Module.symvers  -o /home/corn/projekte/rust_linux/Module.symvers -S -w  -s
gcc -Wp,-MD,/home/corn/projekte/rust_linux/.hello-main.mod.o.d  -nostdinc -isystem /usr/lib/gcc/x86_64-linux-gnu/4.6/include  -I/usr/src/linux-headers-3.2.0-74-generic/arch/x86/include -Iarch/x86/include/generated -Iinclude  -include /usr/src/linux-headers-3.2.0-74-generic/include/linux/kconfig.h -Iubuntu/include  -D__KERNEL__ -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-format-security -fno-delete-null-pointer-checks -O2 -m64 -mtune=generic -mno-red-zone -mcmodel=kernel -funit-at-a-time -maccumulate-outgoing-args -fstack-protector -DCONFIG_AS_CFI=1 -DCONFIG_AS_CFI_SIGNAL_FRAME=1 -DCONFIG_AS_CFI_SECTIONS=1 -DCONFIG_AS_FXSAVEQ=1 -pipe -Wno-sign-compare -fno-asynchronous-unwind-tables -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -Wframe-larger-than=1024 -Wno-unused-but-set-variable -fno-omit-frame-pointer -fno-optimize-sibling-calls -fno-var-tracking-assignments -pg -Wdeclaration-after-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_ASM_GOTO  -D"KBUILD_STR(s)=#s" -D"KBUILD_BASENAME=KBUILD_STR(hello_main.mod)"  -D"KBUILD_MODNAME=KBUILD_STR(hello_main)" -DMODULE  -c -o /home/corn/projekte/rust_linux/hello-main.mod.o /home/corn/projekte/rust_linux/hello-main.mod.c
ld -r -m elf_x86_64 -T /usr/src/linux-headers-3.2.0-74-generic/scripts/module-common.lds --build-id  -o /home/corn/projekte/rust_linux/hello-main.ko /home/corn/projekte/rust_linux/hello-main.o /home/corn/projekte/rust_linux/hello-main.mod.o

