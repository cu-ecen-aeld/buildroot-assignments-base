#!/bin/bash
#Script to build buildroot configuration
#Author: Siddhant Jajoo


BUILDROOT=buildroot
DEFAULT_DEFCONFIG=configs/qemu_aarch64_virt_defconfig
MODIFIED_DEFCONFIG=base_external/configs/aesd_qemu_defconfig
MODIFIED_DEFCONFIG_REL_BUILDROOT=../${MODIFIED_DEFCONFIG}
EXTERNAL_REL_BUILDROOT=../base_external


git submodule init
git submodule sync
git submodule update

set -e 
cd `dirname $0`

if [ ! -e ${BUILDROOT}/.config ]
then
	echo -e "\n MISSING BUILDROOT CONFIGURATION FILE \n"
	
	if [ -e ${MODIFIED_DEFCONFIG} ]
	then
		echo "USING aesd_qemu_defconfig"
		make -C ${BUILDROOT} defconfig BR2_DEFCONFIG=${MODIFIED_DEFCONFIG_REL_BUILDROOT}
	else
		echo "Run ./save_config.sh to save this as the default configuration in ${MODIFIED_DEFCONFIG}"
		echo "Then add packages as needed to complete the installation, re-running ./save_config.sh as needed"
		make -C ${BUILDROOT} defconfig BR2_DEFCONFIG=${DEFAULT_DEFCONFIG}
	fi	
else
	echo "\n USING EXISTING BUILDROOT CONFIG \n"
	echo -e "\n TO FORCE UPDATE, DELETE .config OR MAKE CHANGES USING make menuconfig AND BUILD AGAIN\n"
	make -C ${BUILDROOT} BR2_EXTERNAL=${EXTERNAL_REL_BUILDROOT}

fi
