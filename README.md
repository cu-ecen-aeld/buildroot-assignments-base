# buildroot-rpi


We will be using rpi3

Other configuration of rpi:
----------------------------

Configure Buildroot
-------------------

There are two RaspberryPi defconfig files in Buildroot, one for each
major variant, which you should base your work on:

For models A, B, A+ or B+:

  $ make raspberrypi_defconfig

For model Zero (model A+ in smaller form factor):

  $ make raspberrypi0_defconfig

For model 2 B:

  $ make raspberrypi2_defconfig

For model 3 B and B+:

  $ make raspberrypi3_defconfig

For model 4 B:

  $ make raspberrypi4_defconfig
