################################################################################
#
# RTIMULib
#
################################################################################

RTIMULIB_VERSION = b949681af69b45f0f7f4bb53b6770037b5b02178
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
RTIMULIB_SITE = https://github.com/RPi-Distro/RTIMULib.git
RTIMULIB_SITE_METHOD = git
RTIMULIB_LICENSE = BSD
RTIMULIB_LICENSE_FILES = LICENSE
RTIMULIB_SETUP_TYPE = distutils
RTIMULIB_SUBDIR = Linux/python

$(eval $(python-package))
