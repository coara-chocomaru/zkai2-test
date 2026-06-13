DEVICE_PATH := device/gsl/ztab020
ALLOW_MISSING_DEPENDENCIES := true
TARGET_BOARD_PLATFORM := mt6789
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true
DISABLE_ARTIFACT_PATH_REQUIREMENTS := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 := 
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a55

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a55

# APEX
OVERRIDE_TARGET_FLATTEN_APEX := true


# A/B
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS += \
    system \
    vendor \
    product \
    system_ext \
    vendor_dlkm \
    vendor_boot \
    odm_dlkm \
    boot \
    vbmeta_vendor \
    vbmeta_system

# SAR
BOARD_ROOT_EXTRA_FOLDERS := data_mirror debug_ramdisk linkerconfig odm_dlkm oem postinstall second_stage_resources vendor_dlkm
BOARD_SUPPRESS_SECURE_ERASE := true
