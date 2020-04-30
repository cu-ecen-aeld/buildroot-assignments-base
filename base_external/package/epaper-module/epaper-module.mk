##############################################################
#
# EPAPER CHAR DRIVER
#
##############################################################

EPAPER_MODULE_VERSION = ab0fb9561dda283819cd7800ac194012de032bc1
EPAPER_MODULE_SITE = git@github.com:cu-ecen-5013/waveshare-eink-kernel-driver.git
EPAPER_MODULE_SITE_METHOD = git

EPAPER_MODULE_MODULE_SUBDIRS = module/

$(eval $(kernel-module))
$(eval $(generic-package))

