LOCAL_PATH := device/gsl/ztab020

# API
PRODUCT_SHIPPING_API_LEVEL := 31
PRODUCT_TARGET_VNDK_VERSION := 31
PRODUCT_EXTRA_VNDK_VERSIONS := 31
PRODUCT_FULL_TREBLE_OVERRIDE := true
PRODUCT_TREBLE_LINKER_NAMESPACES := true
PRODUCT_CHARACTERISTICS := tablet

# Dynamic
PRODUCT_USE_DYNAMIC_PARTITIONS := true
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Virtual A/B
ENABLE_VIRTUAL_AB := true
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

# A/B
AB_OTA_UPDATER := true

AB_OTA_PARTITIONS += \
    vendor_boot \
    dtbo \
    system \
    product \
    vendor \
    vendor_dlkm \
    odm_dlkm \
    vbmeta \
    vbmeta_system \
    vbmeta_vendor
    
# Update engine
PRODUCT_PACKAGES += \
    checkpoint_gc \
    update_engine \
    update_engine_sideload \
    update_verifier

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/mtk_plpath_utils \
    FILESYSTEM_TYPE_system=erofs \
    POSTINSTALL_OPTIONAL_system=true

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=erofs \
    POSTINSTALL_OPTIONAL_vendor=true

# Boot control HAL - Bootctrl
PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-mtkimpl \
    android.hardware.boot@1.2-service \
    android.hardware.boot@1.2-mtkimpl.recovery

PRODUCT_PACKAGES += \
    android.hardware.boot@1.0 \
    android.hardware.boot@1.1 \
    android.hardware.boot@1.2

PRODUCT_PACKAGES_DEBUG += \
    bootctrl

PRODUCT_PACKAGES += \
    bootctrl \
    bootctrl.recovery \
    libmtk_bsg

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service \
    android.hardware.health@2.1-impl.recovery

# Fastbootd
PRODUCT_PACKAGES += \
    libgptutils \
    libz \
    libcutils \
    fastbootd \
    android.hardware.fastboot@1.0-impl-mock \
    android.hardware.fastboot@1.0-impl-mock.recovery

PRODUCT_PACKAGES += \
    create_pl_dev \
    create_pl_dev.recovery \
    checkpoint_gc

# Build MT-PL-Utils
PRODUCT_PACKAGES += \
    mtk_plpath_utils \
    mtk_plpath_utils.recovery

# Additional Target Libraries
TARGET_RECOVERY_DEVICE_MODULES += \
    android.hardware.keymaster@4.1

TW_RECOVERY_ADDITIONAL_RELINK_LIBRARY_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.keymaster@4.1.so


# Keymint
PRODUCT_PACKAGES += \
    android.hardware.security.keymint \
    android.hardware.security.secureclock \
    android.hardware.security.sharedsecret

# Keystore2
PRODUCT_PACKAGES += \
    android.system.keystore2

# Keymaster
PRODUCT_PACKAGES += \
    android.hardware.keymaster@4.1

TW_RECOVERY_ADDITIONAL_RELINK_LIBRARY_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.keymaster@4.1.so

# Drm
PRODUCT_PACKAGES += \
    android.hardware.drm@1.4

# libion & libxml2
TARGET_RECOVERY_DEVICE_MODULES += libion

RECOVERY_LIBRARY_SOURCE_FILES += $(TARGET_OUT_SHARED_LIBRARIES)/libion.so

# Hide Reflash TWRP
PRODUCT_PROPERTY_OVERRIDES += ro.twrp.vendor_boot=true

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += $(DEVICE_PATH)
