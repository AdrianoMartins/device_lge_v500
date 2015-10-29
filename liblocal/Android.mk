LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := \
    local_camera.c

LOCAL_SHARED_LIBRARIES := libutils libgui
LOCAL_MODULE := liblocal
LOCAL_MODULE_TAGS := optional
include $(BUILD_SHARED_LIBRARY)

