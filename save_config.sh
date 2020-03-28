#!/bin/bash
#Script to save the modified configuration as modified_qemu_aarch64_virt_defconfig and linux kernel configuration.
#Author: Siddhant Jajoo.

cd `dirname $0`
source shared.sh
mkdir -p base_external/configs/
make -C buildroot savedefconfig BR2_DEFCONFIG=${AESD_MODIFIED_DEFCONFIG_REL_BUILDROOT}

if [ -e buildroot/.config ] && [ -e buildroot/output/build/linux-*/.config ]; then
	grep "BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE" buildroot/.config > /dev/null
	if [ $? -eq 0 ]; then
		echo "Saving linux defconfig"
		make -C buildroot linux-update-defconfig
	fi
fi
