# Nombre del módulo (sin extensión)
MODULE_NAME := memory

# Compilación del módulo
obj-m := $(MODULE_NAME).o

# Ruta al build del kernel
KDIR := /lib/modules/$(shell uname -r)/build
PWD := $(shell pwd)

all:
	make -C $(KDIR) M=$(PWD) modules

clean:
	make -C $(KDIR) M=$(PWD) clean
	rm -f *.ko *.mod.c *.o *.symvers *.order

run: all
	sudo insmod $(MODULE_NAME).ko
	@echo "Módulo cargado:"
	lsmod | grep $(MODULE_NAME)
