AESD_ASSIGNMENTS_VERSION = '4ba7e0af770099aeba98e68f0b9501c38ef301d4'
AESD_ASSIGNMENTS_SITE = 'git@github.com:cu-ecen-5013/Ajitesh-Abikamet-Final-Project-Application.git'
AESD_ASSIGNMENTS_SITE_METHOD = git


define AESD_ASSIGNMENTS_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
endef

#TODO: Add required executables or scripts below
define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/check-config.sh $(TARGET_DIR)/bin
	$(INSTALL) -m 0755 $(@D)/cgroupfs/cgroupfs-mount $(TARGET_DIR)/etc/init.d/S98cgroupfs-mount
endef

$(eval $(generic-package))