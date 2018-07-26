TARGET = iphone::11.2:11.0
ARCHS = arm64
THEOS_DEVICE_IP = 192.168.1.106

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = DarkMail
DarkMail_FILES = Tweak.xm
DarkMail_CFLAGS += -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 MobileMail"
SUBPROJECTS += darkmailprefs
include $(THEOS_MAKE_PATH)/aggregate.mk

after-stage::
	find . -name ".DS_STORE" -delete