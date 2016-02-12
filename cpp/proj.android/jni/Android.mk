LOCAL_PATH := $(call \
my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := cocos2dcpp_shared

LOCAL_MODULE_FILENAME := libcocos2dcpp

LOCAL_SRC_FILES := hellocpp/main.cpp \
../../Classes/AppDelegate.cpp \
../../Classes/HelloWorldScene.cpp

LOCAL_CPPFLAGS := -DSDKBOX_ENABLED
LOCAL_LDLIBS := -landroid \
-llog
LOCAL_C_INCLUDES := $(LOCAL_PATH)/../../Classes
LOCAL_WHOLE_STATIC_LIBRARIES := PluginAdColony \
sdkbox \
PluginChartboost \
PluginAdMob \
PluginVungle \
PluginFyber \
PluginBee7 \
PluginSdkboxAds

LOCAL_STATIC_LIBRARIES := cocos2dx_static

include $(BUILD_SHARED_LIBRARY)
$(call import-add-path,$(LOCAL_PATH))

$(call import-module,./prebuilt-mk)
$(call import-module, ./sdkbox)
$(call import-module, ./pluginadcolony)
$(call import-module, ./pluginchartboost)
$(call import-module, ./pluginadmob)
$(call import-module, ./pluginvungle)
$(call import-module, ./pluginfyber)
$(call import-module, ./pluginbee7)
$(call import-module, ./pluginsdkboxads)
