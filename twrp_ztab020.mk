#
# Copyright (C) 2024 The Android Open Source Project
# Copyright (C) 2024 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/launch_with_vendor_ramdisk.mk)
$(call inherit-product, vendor/twrp/config/common.mk)
$(call inherit-product, device/gsl/ztab020/device.mk)

PRODUCT_DEVICE := ztab020
PRODUCT_NAME := twrp_ztab020
PRODUCT_BRAND := ZMOOTH
PRODUCT_MODEL := ztab020
PRODUCT_MANUFACTURER := GSL

PRODUCT_GMS_CLIENTID_BASE := android-gsl

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.build.product=Zkai-study-Tab \
    ro.product.board=mgvi_64_armv82 \
    ro.product.device=Zkai-study-Tab \
    persist.sys.usb.config=mtp,adb
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="hal_mgvi_64_armv82-user 12 SP1A.210812.016 1rck61v164bspP28 dev-keys"

BUILD_FINGERPRINT := ZMOOTH/Zkai-study-Tab/Zkai-study-Tab:12/SP1A.210812.016/1722332548:user/dev-keys
