
##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

#TODO: Fill up the contents below in order to reference your assignment 3 git contents
AESD_ASSIGNMENTS_VERSION = '#COMMIT VERSION NUMBER'
# Note: Be sure to reference the *https* repository URL here (not ssh) unless you
# are using a private repository, in which case you also need to modify the github
# actions.  See notes in https://github.com/cu-ecen-aeld/aesd-assignments/wiki/Setting-up-Github-Actions#using-an-ssh-key-with-your-runner about
# using ssh keys
AESD_ASSIGNMENTS_SITE = '#GITHUB REPOSITORY HTTPS LINK'
AESD_ASSIGNMENTS_SITE_METHOD = git
AESD_ASSIGNMENTS_GIT_SUBMODULES = YES

define AESD_ASSIGNMENTS_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/finder-app all
endef

# TODO add your writer, finder and finder-test utilities/scripts to the installation steps below
define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
	$(INSTALL) -d 0755 $(@D)/conf/ $(TARGET_DIR)/etc/finder-app/conf/
	$(INSTALL) -m 0755 $(@D)/conf/* $(TARGET_DIR)/etc/finder-app/conf/
	$(INSTALL) -m 0755 $(@D)/assignment-autotest/test/assignment4/* $(TARGET_DIR)/bin
endef

$(eval $(generic-package))
