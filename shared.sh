#!/bin/sh
# Shared definitions for buildroot scripts

# The defconfig from the buildroot directory we use for qemu builds
QEMU_DEFCONFIG=configs/qemu_aarch64_virt_defconfig
# The default hardware platforms, when building for hardware
RPI_DEFCONFIG=configs/raspberrypi3_defconfig
RPI0W_DEFCONFIG=configs/raspberrypi0w_defconfig
# The place we store customizations to the qemu configuration
MODIFIED_QEMU_DEFCONFIG=base_external/configs/aesd_qemu_defconfig
# The place we store customizations for the project current target
MODIFIED_RPI_DEFCONFIG=base_external/configs/aesd_rpi_defconfig
MODIFIED_RPI0W_DEFCONFIG=base_external/configs/aesd_rpi_0w_defconfig


# The defconfig from the buildroot directory we use for the project
AESD_DEFAULT_DEFCONFIG=${RPI_DEFCONFIG}
AESD_MODIFIED_DEFCONFIG=${MODIFIED_RPI_DEFCONFIG}
AESD_MODIFIED_DEFCONFIG_REL_BUILDROOT=../${AESD_MODIFIED_DEFCONFIG}
