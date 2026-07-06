LOCAL_PATH := device/gsl/ztab020

# API
PRODUCT_SHIPPING_API_LEVEL := 31
PRODUCT_TARGET_VNDK_VERSION := 31
PRODUCT_EXTRA_VNDK_VERSIONS := 31
PRODUCT_FULL_TREBLE_OVERRIDE := true
PRODUCT_TREBLE_LINKER_NAMESPACES := true
PRODUCT_CHARACTERISTICS := tablet
PRODUCT_ENFORCE_VINTF_MANIFEST := true 

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
    update_verifier \

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
    android.hardware.boot@1.2-service \
    android.hardware.boot@1.2-mtkimpl \
    android.hardware.boot@1.2-mtkimpl.recovery \

# 1.0
PRODUCT_PACKAGES += \
android.hardware.boot@1.0-impl \
android.hardware.boot@1.0-service \
android.hardware.boot@1.0-impl.recovery \


PRODUCT_PACKAGES_DEBUG += \
    bootctrl

PRODUCT_PACKAGES += \
    bootctrl \
    bootctrl.default \
    bootctrl.recovery \
    libmtk_bsg \

PRODUCT_PACKAGES += \
    bootctrl.mt6789 \
    bootctrl.mt6789.recovery \

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service \

# Fastbootd
PRODUCT_PACKAGES += \
    libgptutils \
    libz \
    libcutils \
    fastbootd \
    lpdump \
    lpunpack \
    lpmake \
    android.hardware.fastboot@1.0-impl-mock \

# Build MT-PL-Utils
PRODUCT_PACKAGES += \
    mtk_plpath_utils \
    mtk_plpath_utils.recovery \


TARGET_RECOVERY_DEVICE_MODULES += \
    keystore2 \
    libkeystore2 \
    libkeystore2_aaid \
    libkeystore2_apc_compat \
    libkeystore2_crypto \
    libkeystore2_flags \
    libkeystore2_hal_names \
    libkeystore2_km_compat \
    libkeystore2_selinux \
    libbinder \
    libbinder_ndk \
    libbinder_rs \
    libhwbinder \
    libhidltransport \
    libhidlbase \
    android.hardware.security.keymint \
    android.hardware.security.secureclock \
    android.hardware.security.sharedsecret \
    libkeymint_support \
    libkeymaster4 \
    libkeymaster4_1 \
    libkeymaster4support \
    libkeymaster4_1support \
    libtrustkernel_keymint \
    libtrustkernel_tee \
    libtee_client \
    libtz_shared \
    libbase \
    libcutils \
    libutils \
    liblog \
    libhardware \
    libcrypto \
    libssl \
    libanyhow \
    libserde \
    libserde_cbor \
    libthiserror \
    libtokio \
    librand \
    libhex \
    libder \
    libsqlite3 \
    librusqlite \
    android.hardware.security.rkp-V3-rust \
    android.hardware.security.secureclock-V1-rust \
    android.hardware.security.sharedsecret-V1-rust \
    android.os.permissions_aidl-rust \
    android.security.apc-rust \
    android.security.authorization-rust \
    android.security.compat-rust \
    android.security.maintenance-rust \
    android.security.metrics-rust \
    android.security.rkp_aidl-rust \
    apex_aidl_interface-rust \
    librkpd_client \
    libpostprocessor_client \
    libwatchdog_rs \
    android.hardware.boot@1.0-impl \
    android.hardware.boot@1.0-service \
    android.hardware.boot@1.0-impl.recovery \
    android.hardware.boot@1.2-service \
    android.hardware.boot@1.2-mtkimpl \
    android.hardware.boot@1.0 \
    android.hardware.boot@1.1 \
    android.hardware.boot@1.2 \
    android.hardware.keymaster@4.1 \
    android.system.keystore2-V1-ndk_platform \
    libion \
    mtk_plpath_utils \
    libmtk_bsg \
    libkeymaster4support \
    libkeymaster4_1support \
    libkeymaster4 \
    libkeymaster4_1 \
    libhidltransport \
    libhwbinder \
    libbinder \
    libbinder_ndk \
    libutils \
    libcutils \
    liblog \
    libhardware \
    libbase \
    libkeymint_support

RECOVERY_LIBRARY_SOURCE_FILES += $(TARGET_OUT_SHARED_LIBRARIES)/libion.so
RECOVERY_LIBRARY_SOURCE_FILES += $(TARGET_OUT_SHARED_LIBRARIES)/libkeystore2.so
RECOVERY_LIBRARY_SOURCE_FILES += $(TARGET_OUT_SHARED_LIBRARIES)/libkeymaster4support.so

PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0.vendor \
    android.hardware.gatekeeper@1.0-impl \
    android.hardware.gatekeeper@1.0-service \


RECOVERY_BINARY_SOURCE_FILES += \
    $(TARGET_OUT_EXECUTABLES)/android.hardware.boot@1.0-service \
    $(TARGET_OUT_EXECUTABLES)/android.hardware.boot@1.2-service \
    $(TARGET_OUT_EXECUTABLES)/mtk_plpath_utils \

# Keymint
PRODUCT_PACKAGES += \
    android.hardware.security.keymint \
    android.hardware.security.secureclock \
    android.hardware.security.sharedsecret \

# Keystore2
PRODUCT_PACKAGES += \
    android.system.keystore2 \

# Keymaster
PRODUCT_PACKAGES += \
    android.hardware.keymaster@4.0.vendor \
    android.hardware.keymaster@4.1 \

# Drm
PRODUCT_PACKAGES += \
    android.hardware.drm@1.4 \

# Hide Reflash TWRP
PRODUCT_PROPERTY_OVERRIDES += ro.twrp.vendor_boot=true

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += $(DEVICE_PATH)
