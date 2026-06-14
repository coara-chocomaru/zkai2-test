DEVICE_PATH := device/gsl/ztab020
ALLOW_MISSING_DEPENDENCIES := true
TARGET_BOARD_PLATFORM := mt6789
BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true
DISABLE_ARTIFACT_PATH_REQUIREMENTS := true
ENABLE_CPUSETS := true
ENABLE_SCHEDBOOST := true

# mtk
BOARD_USES_MTK_HARDWARE := true
BOARD_HAS_MTK_HARDWARE := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-2a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a55
TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-2a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a55

TARGET_BOARD_SUFFIX := _64
TARGET_USES_64_BIT_BINDER := true
TARGET_SUPPORTS_64_BIT_APPS := true
TARGET_IS_64_BIT := true

# APEX
OVERRIDE_TARGET_FLATTEN_APEX := true

TARGET_BOOTLOADER_BOARD_NAME := mgvi_64_armv82
TARGET_NO_BOOTLOADER := true
TARGET_USES_UEFI := false

# Kernel
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64

TARGET_NO_KERNEL := true
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb

BOARD_VENDOR_CMDLINE := bootopt=64S3,32N2,64N2
BOARD_KERNEL_BASE := 0x3fff8000
BOARD_PAGE_SIZE := 4096
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_RAMDISK_OFFSET := 0x66f00000
BOARD_TAGS_OFFSET := 0x47c80000
BOARD_BOOT_HEADER_VERSION := 4
BOARD_HEADER_SIZE := 2128
BOARD_DTB_SIZE := 193004
BOARD_DTB_OFFSET := 0x47c80000
BOARD_FLASH_BLOCK_SIZE := 262144

BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)
BOARD_MKBOOTIMG_ARGS += --vendor_cmdline $(BOARD_VENDOR_CMDLINE)
BOARD_MKBOOTIMG_ARGS += --pagesize $(BOARD_PAGE_SIZE)
BOARD_MKBOOTIMG_ARGS += --kernel_offset $(BOARD_KERNEL_OFFSET)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --dtb_offset $(BOARD_DTB_OFFSET)
BOARD_KERNEL_SEPARATED_DTBO := true
BOARD_RAMDISK_USE_LZ4 := true


# SAR
BOARD_BUILD_SYSTEM_ROOT_IMAGE := false
BOARD_SUPPRESS_SECURE_ERASE := true



# AVB
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3
BOARD_AVB_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA4096
BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1
BOARD_VNDK_VERSION := current
BOARD_AVB_RECOVERY_ADD_HASH_FOOTER_ARGS += \
    --prop com.android.build.boot.os_version:$(PLATFORM_VERSION) \
    --prop com.android.build.boot.security_patch:$(PLATFORM_SECURITY_PATCH)

#security
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := 2024-07-05
BOOT_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)
PLATFORM_VERSION := 99.99.99
PLATFORM_VERSION_LAST_STABLE := $(PLATFORM_VERSION)


# Partitions
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_SUPER_PARTITION_SIZE := 9663676416
BOARD_SUPER_PARTITION_GROUPS := main
BOARD_MAIN_SIZE := 9642704896 # (BOARD_SUPER_PARTITION_SIZE - 4194304) 4MiB
BOARD_MAIN_PARTITION_LIST := system product vendor vendor_dlkm odm odm_dlkm

BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_ODMIMAGE_FILE_SYSTEM_TYPE := ext4

BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs

TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

TARGET_COPY_OUT_ODM := odm
TARGET_COPY_OUT_PRODUCT := product
TARGET_COPY_OUT_SYSTEM := system
TARGET_COPY_OUT_VENDOR := vendor

# Build a separate vendor_dlkm partition
BOARD_USES_VENDOR_DLKMIMAGE := true
BOARD_VENDOR_DLKMIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR_DLKM := vendor_dlkm

# Build a separate odm_dlkm partition
BOARD_USES_ODM_DLKMIMAGE := true
BOARD_ODM_DLKMIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_ODM_DLKM := odm_dlkm

# Metadata
BOARD_USES_METADATA_PARTITION := true
BOARD_ROOT_EXTRA_FOLDERS += metadata

# Recovery
TARGET_NO_RECOVERY := true
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_HAS_NO_SELECT_BUTTON := true

BOARD_EXCLUDE_KERNEL_FROM_RECOVERY_IMAGE := true
BOARD_MOVE_RECOVERY_RESOURCES_TO_VENDOR_BOOT := true
BOARD_INCLUDE_RECOVERY_RAMDISK_IN_VENDOR_BOOT := true
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888

RECOVERY_SDCARD_ON_DATA := true

# display
TARGET_SCREEN_DENSITY := 240
BOARD_USE_FRAMEBUFFER_ALPHA_CHANNEL := true
TARGET_DISABLE_TRIPLE_BUFFERING := false
TARGET_SCREEN_WIDTH := 1920
TARGET_SCREEN_HEIGHT := 1080
TW_THEME := landscape_hdpi
TW_ROTATION := 270

# Charger Mode
BOARD_CHARGER_ENABLE_SUSPEND := true
BOARD_CHARGER_DISABLE_INIT_BLANK := true

# prop
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/vendor.prop


TARGET_USE_CUSTOM_LUN_FILE_PATH := /config/usb_gadget/g1/functions/mass_storage.usb0/lun.%d/file

# Debug
TARGET_USES_LOGD := true
TWRP_INCLUDE_LOGCAT := true

# Crypto
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_FBE := true
TW_INCLUDE_FBE_METADATA_DECRYPT := true
BOARD_USES_METADATA_PARTITION := true
TW_USE_FSCRYPT_POLICY := 2
TW_PREPARE_DATA_MEDIA_EARLY := true
TW_FORCE_KEYMASTER_VER := true
TW_IS_FBE := 1

# Tools
TW_INCLUDE_FASTBOOTD := true
TW_INCLUDE_RESETPROP := true
TW_INCLUDE_LIBRESETPROP :=true

# TWRP Configuration
TW_DEFAULT_LANGUAGE := en
TW_INPUT_BLACKLIST := hbtp_vm
TW_MAX_BRIGHTNESS := 255
TW_DEFAULT_BRIGHTNESS := 100
TW_EXTRA_LANGUAGES := false
TARGET_USES_MKE2FS := true
TW_DEVICE_VERSION := $(shell date -u +" %F")
TW_USE_MODEL_HARDWARE_ID_FOR_DEVICE_ID := true
TW_NO_SCREEN_BLANK := true
#TW_SCREEN_BLANK_ON_BOOT := true
TW_HAS_MTP := true

TW_INCLUDE_FUSE_EXFAT := true

TW_EXCLUDE_APEX := true
TW_EXCLUDE_TWRPAPP := true
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_BACKUP_EXCLUSIONS := /data/fonts/files

#vendor_boot
TW_LOAD_VENDOR_BOOT_MODULES := true
BOARD_MOVE_GSI_AVB_KEYS_TO_VENDOR_BOOT := true
BOARD_MOVE_RECOVERY_RESOURCES_TO_VENDOR_BOOT := true
BOARD_INCLUDE_RECOVERY_RAMDISK_IN_VENDOR_BOOT := true

# TW_LOAD_VENDOR_MODULES := "mkp.ko bootprof.ko dbgtop-drm.ko mrdump.ko mtk_disp_notify.ko mtk_printk_ctrl.ko log_store.ko nvmem_mtk-devinfo.ko mtk_wdt.ko sec-rng.ko device-apc-common.ko device-apc-mt6789.ko pinctrl-mtk-v2.ko pinctrl-mt6789.ko zsmalloc.ko zram.ko clk-common.ko clk-mt6789.ko clk-mt6789-audiosys.ko clk-mt6789-cam.ko clk-mt6789-mmsys.ko clk-mt6789-img.ko clk-mt6789-i2c.ko clk-mt6789-bus.ko clk-mt6789-vcodec.ko clk-mt6789-disp_dsc.ko clk-mt6789-impen.ko clk-mt6789-mfgcfg.ko mtk-scpsys.ko mtk-scpsys-mt6789.ko mtk-scpsys-bringup.ko clk-bringup.ko pd-chk-mt6789.ko clk-fmeter-mt6789.ko mtk_dramc.ko mtk-dvfsrc.ko mtk-dvfsrc-regulator.ko mtk-emi.ko mtk-smi.ko arm_dsu_pmu.ko mtk-icc-core.ko mtk-mmdvfs.ko mmqos-common.ko mmqos-mt6789.ko iommu_secure.ko mtk_iommu.ko mtk_mm_heap.ko system_heap.ko mtk-cmdq-drv-ext.ko cmdq-platform-mt6789.ko cmdq_helper_inf.ko mtk-mml.ko mtk_panel_ext.ko hct_lt8911_edp_mipi.ko hct_devices.ko hct_proc.ko panel-alpha-boe-lt8911-edp-60hz-vfp.ko mediatek-drm.ko mtk-uart-apdma.ko 8250_mtk.ko phy-generic.ko phy-mtk-tphy.ko musb_boost.ko musb_hdrc.ko musb_main.ko mtk-pmic-wrap.ko mt635x-auxadc.ko mt6397.ko mtk-spmi-pmic.ko spmi-mtk-pmif.ko mt6358-regulator.ko regmap-spmi.ko cqhci.ko mtk-mmc-autok.ko mtk-mmc.ko phy-mtk-ufs.ko rpmb.ko rpmb-mtk.ko ufs-mediatek-mod.ko blocktag.ko pidmap.ko mtk-pmic-keys.ko mtk-kpd.ko i2c-mt65xx.ko rtc-mt6397.ko spi-mt65xx.ko mt6375.ko extdev_io_class.ko rt5133-regulator.ko wl2864c-regulator.ko clkbuf.ko industrialio-triggered-buffer.ko kfifo_buf.ko mt6375-adc.ko mt6375-auxadc.ko adapter_class.ko charger_class.ko mtk_charger_algorithm_class.ko mt6375-charger.ko tcpc_class.ko tcpc_mt6375.ko tcpc_rt1711h.ko tcpc_husb311.ko mtk_chg_type_det.ko mtk_pd_adapter.ko mtk_pd_charging.ko mtk_charger_framework.ko rt_pd_manager.ko mt6358_battery.ko pwm-mtk-disp.ko leds-mtk.ko leds-mtk-disp.ko leds-mtk-pwm.ko rt4831a_drv.ko extcon-mtk-usb.ko tcpci_late_sync.ko reboot-mode.ko syscon-reboot-mode.ko meta.ko mtk-cqdma.ko mtk_sync.ko emi.ko emi-mpu.ko tinysys-scmi.ko tkcore_drv.ko tkcore.ko mtk-mbox-mailbox.ko mtk_rpmsg_mbox.ko mtk-mbox.ko mtk_tinysys_ipi.ko clk-disable-unused.ko mtk-pm-domain-disable-unused.ko sec.ko"




