
##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################


ASSIGNMENT_AUTOTEST_VERSION = 75cf80a797e5595f9f5c18cc2f71bcb670e72044
ASSIGNMENT_AUTOTEST_SITE = git@github.com:cu-ecen-5013/assignment-autotest.git
ASSIGNMENT_AUTOTEST_SITE_METHOD = git

define ASSIGNMENT_AUTOTEST_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/test/assignment4/* $(TARGET_DIR)/bin
endef


$(eval $(generic-package))
