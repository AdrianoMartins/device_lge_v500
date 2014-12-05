LOCAL_PATH := $(call my-dir)

BUMP := $(LOCAL_PATH)/bump/bump.py

ifeq ($(TARGET_REQUIRES_BUMP),true)
	$(hide) $(BUMP) $@ $@
endif
