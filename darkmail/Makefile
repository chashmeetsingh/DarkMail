TARGET = iphone::11.2:11.0
ARCHS = arm64 arm64e

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = DarkMail
DarkMail_FILES = darkmail.m
DarkMail_INSTALL_PATH = /Library/PreferenceBundles
DarkMail_FRAMEWORKS = UIKit
DarkMail_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/DarkMail.plist$(ECHO_END)
