################################################################################
#
# wheel
#
################################################################################

WHEEL_VERSION = 0.37.1
WHEEL_SOURCE = wheel-$(WHEEL_VERSION).tar.gz
WHEEL_SITE = https://files.pythonhosted.org/packages/c0/6c/9f840c2e55b67b90745af06a540964b73589256cb10cc10057c87ac78fc2
WHEEL_LICENSE = Apache License
WHEEL_LICENSE_FILES = LICENSE
WHEEL_SETUP_TYPE = distutils

$(eval $(python-package))
