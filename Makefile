KERNEL_VERSION := 5.3.0-24-generic
KERNELDIR := /lib/modules/$(KERNEL_VERSION)/build
PWD       := $(shell pwd)

obj-m+=./drivers/usb/serial/usb_wwan$(SRC_VERSION).o
obj-m+=./drivers/usb/serial/option$(SRC_VERSION).o
obj-m+=./drivers/usb/serial/qcserial$(SRC_VERSION).o
obj-m+=./drivers/net/usb/qmi_wwan$(SRC_VERSION).o

modules: clean
	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules

install: modules
	cp $(PWD)/drivers/usb/serial/option.ko /lib/modules/$(shell uname -r)/kernel/drivers/usb/serial/
	cp $(PWD)/drivers/usb/serial/usb_wwan.ko /lib/modules/$(shell uname -r)/kernel/drivers/usb/serial/
	cp $(PWD)/drivers/usb/serial/qcserial.ko /lib/modules/$(shell uname -r)/kernel/drivers/usb/serial/
	cp $(PWD)/drivers/net/usb/qmi_wwan.ko /lib/modules/$(shell uname -r)/kernel/drivers/net/usb/
	modprobe -r option qcserial  qmi_wwan
	depmod

clean:
	rm -rf *~ .tmp_versions modules.order Module.symvers
	find . -type f -name *~ -o -name *.o -o -name *.ko -o -name *.cmd -o -name *.mod.c |  xargs rm -rf
