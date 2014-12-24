#
# Copyright (C) 2013 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#


# Try to build the kernel
#TARGET_KERNEL_SOURCE := kernel
#TARGET_KERNEL_CONFIG := awifi-perf_defconfig

#TARGET_PREBUILT_KERNEL := $(KERNEL_OUT)/arch/arm/boot/zImage
ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/lge/v500/zImage
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif
	
PRODUCT_COPY_FILES := \
	$(LOCAL_KERNEL):kernel
	
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

PRODUCT_CHARACTERISTICS := tablet

PRODUCT_PACKAGES += \
    charger_res_images
    
# Live Wallpapers
PRODUCT_PACKAGES += \
        LiveWallpapers \
        LiveWallpapersPicker \
        VisualizationWallpapers \
        librs_jni

PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/init.awifi.usb.rc:root/init.awifi.usb.rc \
	$(LOCAL_PATH)/init.awifi.rc:root/init.awifi.rc \
	$(LOCAL_PATH)/fstab.gvar:root/fstab.awifi \
	$(LOCAL_PATH)/ueventd.awifi.rc:root/ueventd.awifi.rc

PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/WCNSS_cfg.dat:system/vendor/firmware/wlan/prima/WCNSS_cfg.dat \
        $(LOCAL_PATH)/WCNSS_qcom_cfg.ini:system/etc/wifi/WCNSS_qcom_cfg.ini \
        $(LOCAL_PATH)/WCNSS_qcom_cfg.ini:system/firmware/wlan/prima/WCNSS_qcom_cfg.ini \
        $(LOCAL_PATH)/WCNSS_qcom_wlan_nv.bin:system/etc/wifi/WCNSS_qcom_wlan_nv.bin

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/audio_policy.conf:system/etc/audio_policy.conf

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/media_profiles.xml:system/etc/media_profiles.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml \
	$(LOCAL_PATH)/media_codecs.xml:system/etc/media_codecs.xml

# Prebuilt kl and kcm keymaps
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/hs_detect.kl:system/usr/keylayout/hs_detect.kl \
	$(LOCAL_PATH)/pmic8xxx_pwrkey.kl:system/usr/keylayout/pmic8xxx_pwrkey.kl \
	$(LOCAL_PATH)/awifi-keypad-8064.kl:system/usr/keylayout/awifi-keypad-8064.kl

# Prebuilt input device calibration files
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/touch_mxt1188S.idc:system/usr/idc/touch_mxt1188S.idc

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
	frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
	frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
	frameworks/native/data/etc/android.hardware.camera.raw.xml:system/etc/permissions/android.hardware.camera.raw.xml \
	frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
	frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
	frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.compass.xml \
	frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
	frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
	frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
	frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml

# GPS configuration
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/gps.conf:system/etc/gps.conf \
	$(LOCAL_PATH)/sap.conf:system/etc/sap.conf

PRODUCT_PROPERTY_OVERRIDES += \
	ro.opengles.version=196608

# Audio Configuration
# FIXME: Remove persist.audio.handset.mic and persist.audio.fluence.mode
#        while switching new audio HAL from legacy HAL
PRODUCT_PROPERTY_OVERRIDES += \
	persist.audio.handset.mic=digital \
	persist.audio.fluence.mode=endfire \
	persist.audio.lowlatency.rec=false

#Upto 3 layers can go through overlays
PRODUCT_PROPERTY_OVERRIDES += persist.hwc.mdpcomp.enable=true

PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_PACKAGES += \
	librs_jni \
	com.android.future.usb.accessory

# Filesystem management tools
PRODUCT_PACKAGES += \
	e2fsck

PRODUCT_PACKAGES += \
	libgenlock \
	liboverlay \
	hwcomposer.msm8960 \
	gralloc.msm8960 \
	copybit.msm8960 \
	memtrack.msm8960

PRODUCT_PACKAGES += \
	audio_policy.msm8960 \
	audio.primary.msm8960 \
	audio.a2dp.default \
	audio.usb.default \
	audio.r_submix.default \
	libaudio-resampler

# Media
PRODUCT_PACKAGES += \
    libc2dcolorconvert \
    libdivxdrmdecrypt \
    libdashplayer \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxCore \
    libOmxEvrcEnc \
    libOmxQcelp13Enc \
    libOmxVdec \
    libOmxVdecHevc \
    libOmxVenc \
    libstagefrighthw

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	rild.libpath=/system/lib/libril-qc-qmi-1.so

PRODUCT_PROPERTY_OVERRIDES += \
	drm.service.enabled=true

PRODUCT_PROPERTY_OVERRIDES += \
	wifi.interface=wlan0 \
	wifi.supplicant_scan_interval=15

# Enable AAC 5.1 output
PRODUCT_PROPERTY_OVERRIDES += \
	media.aac_51_output_enabled=true

PRODUCT_PROPERTY_OVERRIDES += \
        debug.egl.recordable.rgba8888=1

PRODUCT_PROPERTY_OVERRIDES += \
	ro.qc.sensors.wl_dis=true \
	ro.qualcomm.sensors.smd=true

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	persist.sys.usb.config=mtp

PRODUCT_PACKAGES += \
	lights.msm8960

PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/mixer_paths.xml:system/etc/mixer_paths.xml

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/thermald.conf:system/etc/thermald.conf

PRODUCT_PROPERTY_OVERRIDES += \
	ro.sf.lcd_density=320

PRODUCT_PACKAGES += \
	conn_init \
	hwaddrs \
	macloader \
	libwpa_client \
	hostapd \
	dhcpcd.conf \
	wpa_supplicant \
	wpa_supplicant.conf

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/init.qcom.bt.sh:system/etc/init.qcom.bt.sh

PRODUCT_PROPERTY_OVERRIDES += \
	ro.bt.bdaddr_path=/data/misc/bdaddr

# This hw ships locked, work around it with loki
PRODUCT_PACKAGES += \
	loki.sh \
	loki_tool_static_gpad \
	recovery-transform.sh

PRODUCT_PROPERTY_OVERRIDES += \
	ro.radio.noril=true \
	ro.carrier=wifi-only


$(call inherit-product, hardware/qcom/msm8960/msm8960.mk)

$(call inherit-product, frameworks/native/build/tablet-7in-xhdpi-2048-dalvik-heap.mk)
