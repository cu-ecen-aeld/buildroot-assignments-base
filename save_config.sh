#!/bin/bash
#Script to save the modified configuration as modified_qemu_aarch64_virt_defconfig and linux kernel configuration.
#Author: Siddhant Jajoo.

cd `dirname $0`
mkdir -p base_external/configs/
make -C buildroot savedefconfig BR2_DEFCONFIG=../base_external/configs/aesd_qemu_defconfig

