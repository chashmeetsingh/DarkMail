ARCHS = armv7 armv7s arm64
TARGET = iphone::9.3:9.0
THEOS_DEVICE_IP = 192.168.1.100

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = DarkMail
DarkMail_FILES = Tweak.xm

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += darkmailprefs
include $(THEOS_MAKE_PATH)/aggregate.mk
