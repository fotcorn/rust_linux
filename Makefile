ifneq ($(KERNELRELEASE),)
obj-m  := hello.o
hello-y := lib.o hello-main.o

else
KDIR ?= /lib/modules/`uname -r`/build

default: genbin
	$(MAKE) -C $(KDIR) M=$$PWD

clean:
	$(MAKE) -C $(KDIR) M=$$PWD clean

# Module specific targets
genbin:
	rustc --emit obj hello-main.rs --crate-type lib -C no-stack-check -C relocation-model=static

endif
