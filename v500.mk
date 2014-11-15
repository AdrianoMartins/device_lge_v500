# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)

PRODUCT_NAME := full_v500
PRODUCT_DEVICE := v500
PRODUCT_BRAND := lge
PRODUCT_MODEL := LG-V500
PRODUCT_MANUFACTURER := LGE

# Inherit from hardware-specific part of the product configuration
$(call inherit-product, device/lge/v500/device.mk)
$(call inherit-product-if-exists, vendor/lge/v500/v500-vendor.mk)
