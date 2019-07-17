ENIGMA_ROOT := $(call my-dir)/../../
ENIGMA_SHELL := $(ENIGMA_ROOT)/ENIGMAsystem/SHELL
EXTERNAL := $(ENIGMA_ROOT)/android/external

include $(EXTERNAL)/SDL2/Android.mk
include $(CLEAR_VARS)

LOCAL_MODULE := enigma

LOCAL_C_INCLUDES := $(ENIGMA_SHELL) $(EXTERNAL)/hacks $(EXTERNAL)/libepoxy/include/
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_C_INCLUDES) 

LOCAL_C_INCLUDES += $(ENIGMA_ROOT)/shared $(ENIGMA_SHELL)/Bridges/OpenGLES/ $(EXTERNAL)/SDL2/include/ $(EXTERNAL)/glad/gles2/include $(EXTERNAL)/glm $(ENIGMA_SHELL)/Platforms/SDL/fileio /tmp/ENIGMA
LOCAL_CFLAGS := -DDEBUG_MODE -DENIGMA_PLATFORM_SDL
LOCAL_CPP_FLAGS := -stdlib=libc++ -std=c++11

LOCAL_SRC_FILES := $(addprefix $(ENIGMA_SHELL)/, $(shell cat $(WORKDIR)/sources.list)) $(EXTERNAL)/glad/gles2/src/glad.c

LOCAL_SHARED_LIBRARIES := SDL2
LOCAL_LDLIBS := -lGLESv2 -llog -lz
include $(BUILD_SHARED_LIBRARY)
