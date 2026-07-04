#!/sbin/sh

MODULE_DIR=/kmodule
load_mod() {
    /system/bin/insmod "$MODULE_DIR/$1" 2>/dev/null || true
}

load_mod gz_trusty_mod.ko
load_mod gz_virtio_mod.ko
load_mod gz_irq_mod.ko
load_mod mtk-afe-external.ko
load_mod mtk-pwm.ko
load_mod i2c-hid.ko
load_mod focaltech_fp.ko
load_mod rps_perf.ko
load_mod gz_ipc_mod.ko
load_mod gz_tz_system.ko
load_mod iommu_gz.ko
load_mod trusted_mem.ko
load_mod cmdq-sec-drv.ko
load_mod mtk_sec_heap.ko
load_mod gz_main_mod.ko
load_mod mdp_drv_mt6789.ko
load_mod mtk_u_ether.ko
load_mod mtk_usb_f_rndis.ko


setprop vendor.all.modules.ready 1
