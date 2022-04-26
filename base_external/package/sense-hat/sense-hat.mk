################################################################################
#
# sense-hat
#
################################################################################

SENSE_HAT_VERSION = 2.2.0
SENSE_HAT_SOURCE = sense-hat-$(SENSE_HAT_VERSION).tar.gz
SENSE_HAT_SITE = https://files.pythonhosted.org/packages/15/be/b4fb144778db838aaf6bf86d939407627b2e6283503fa91195dbcafeb6c6
SENSE_HAT_SETUP_TYPE = setuptools
SENSE_HAT_LICENSE = BSD
SENSE_HAT_LICENSE_FILES = LICENSE

$(eval $(python-package))
