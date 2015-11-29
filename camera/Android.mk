LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
    CameraWrapper.cpp

LOCAL_SHARED_LIBRARIES := \
    libhardware liblog libcamera_client libutils

LOCAL_C_INCLUDES += \
    system/media/camera/include

LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/hw
LOCAL_MODULE := camera.$(TARGET_BOARD_PLATFORM)
LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)
#include $(BUILD_HEAPTRACKED_SHARED_LIBRARY)

# Shim required for camera hal
include $(CLEAR_VARS)
LOCAL_SRC_FILES := \
    libcamera_shim.c

LOCAL_SHARED_LIBRARIES := libutils libgui
LOCAL_MODULE := libcamera_shim
LOCAL_MODULE_TAGS := optional
include $(BUILD_SHARED_LIBRARY)
