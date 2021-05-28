ENIGMA_ROOT := $(call my-dir)/../../
ENIGMA_SHELL := $(ENIGMA_ROOT)/ENIGMAsystem/SHELL
EXTERNAL := $(ENIGMA_ROOT)/android/external
WORKDIR := /tmp/ENIGMA

include $(EXTERNAL)/SDL2/Android.mk
include $(CLEAR_VARS)

LOCAL_MODULE := enigma

LOCAL_C_INCLUDES := $(ENIGMA_SHELL) $(ENIGMA_SHELL)/Graphics_Systems/OpenGLES/wrappers $(EXTERNAL)/hacks $(EXTERNAL)/libepoxy/include/
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_C_INCLUDES) 

LOCAL_C_INCLUDES += $(ENIGMA_ROOT)/shared $(ENIGMA_SHELL)/Bridges/OpenGLES/ $(EXTERNAL)/SDL2/include/ $(EXTERNAL)/glad/gles2/include $(EXTERNAL)/glm $(ENIGMA_SHELL)/Platforms/SDL/fileio $(CODEGEN)
LOCAL_CFLAGS := -DDEBUG_MODE -DENIGMA_PLATFORM_SDL
LOCAL_CPPFLAGS := -stdlib=libc++ -std=c++17

LOCAL_SRC_FILES := $(addprefix $(ENIGMA_SHELL)/, $(shell cat $(WORKDIR)/sources.list))

LOCAL_SHARED_LIBRARIES := SDL2
LOCAL_LDLIBS := -lGLESv2 -llog -lz
include $(BUILD_SHARED_LIBRARY)
