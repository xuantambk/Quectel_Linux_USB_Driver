# Introduction

Quectel USB Serial Driver for UCxx/EC2x/EGxx/EP06/EM06/BG96/AG35.

I just modify from https://github.com/bacnh85/Quectel_Linux_USB_Driver to support 
Linux Kernel version above 5.3

# Prepare

Ubuntu 18.04 LTS running kernel 5.3.x-generic.

To check your kernel verison please run :
```
$ uname -a
Linux ubuntu 5.3.0-24-generic  #46~16.04.1-Ubuntu SMP Fri Dec 7 13:31:08 UTC 2018 x86_64 x86_64 x86_64 GNU/Linux
```

Download Ubuntu linux headers:

```
$ sudo apt-get install linux-headers-$(uname -r)
```

the Linux headers will be located in /usr/src/

# Compile/Install

Determine the kernel version:

```
$ uname -r
```
Checkout the driver to the correct kernel version:

```
$ git clone git@github.com:ngohaibac/Quectel_USB_Serial_Driver.git
$ cd Quectel_USB_Serial_Driver
$ git checkout 4.15.0
$ make 
$ sudo make install
```

# Credit

This guide and kernel driver is based on Quectel Driver User Guide V1.8 by Quectel Wirreless Solutions.
