ENIGMA_ROOT := $(shell realpath $$PWD/../../)
ENIGMA_SHELL := $(ENIGMA_ROOT)/ENIGMAsystem/SHELL
EXTERNAL := $(ENIGMA_ROOT)/android/external
WORKDIR := /tmp/ENIGMA

include $(WORKDIR)/build.makefiles

include $(CLEAR_VARS)

LOCAL_MODULE := enigma

IGNORE_WARNINGS := -Wno-unused-parameter -Wno-ignored-qualifiers  -Wno-dollar-in-identifier-extension

LOCAL_EXPORT_C_INCLUDES := $(LOCAL_C_INCLUDES)
LOCAL_CFLAGS :=  $(shell cat $(WORKDIR)/build.cflags) $(IGNORE_WARNINGS)
LOCAL_CPPFLAGS := -stdlib=libc++ -I$(EXTERNAL)/hacks $(shell cat $(WORKDIR)/build.cxxflags | sed "s#-I\\([^/]\\)#-I$(ENIGMA_SHELL)/\\1#g") $(IGNORE_WARNINGS)

LOCAL_SRC_FILES := $(shell for i in $(shell cat $(WORKDIR)/sources.list); do echo $$i | sed "s#\\(^[^/]\\)#$(ENIGMA_SHELL)/\\1#g"; done | xargs echo)

LOCAL_SHARED_LIBRARIES := $(shell cat $(WORKDIR)/build.libs)
LOCAL_LDLIBS := $(shell cat $(WORKDIR)/build.ldlibs) -llog -lz
include $(BUILD_SHARED_LIBRARY)
