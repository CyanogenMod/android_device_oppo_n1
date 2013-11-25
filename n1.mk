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

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay vendor/extra/overlays/phone-1080p
# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

# Init scripts
PRODUCT_PACKAGES += \
    init.qcom.class_core.sh \
    init.qcom.class_main.sh \
    init.qcom.early_boot.sh \
    init.qcom.sh

# Config scripts
PRODUCT_PACKAGES += \
    init.crda.sh \
    init.qcom.bt.sh \
    init.qcom.efs.sync.sh \
    init.qcom.post_boot.sh \
    init.qcom.usb.sh \
    init.qcom.wifi.sh \
    init.recovery.qcom.rc

# Ramdisk
PRODUCT_PACKAGES += \
    fstab.qcom \
    init.qcom.rc \
    init.qcom.usb.rc \
    init.target.rc \
    ueventd.qcom.rc

# Recovery
#PRODUCT_PACKAGES += \
#    init.recovery.qcom.rc

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_policy.conf:system/etc/audio_policy.conf \
    $(LOCAL_PATH)/audio/snd_soc_msm_2x_Fusion3:system/etc/snd_soc_msm/snd_soc_msm_2x_Fusion3

PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio_policy.msm8960 \
    audio.primary.msm8960 \
    audio.r_submix.default \
    audio.usb.default \
    libaudio-resampler \
    tinymix

# Camera
PRODUCT_PACKAGES += \
    camera.msm8960

# Charger
PRODUCT_PACKAGES += \
    charger_res_images_n1 \
    charger_n1

# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
    e2fsck \
    setup_fs

# GPS
PRODUCT_PACKAGES += \
    gps.msm8960

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/gps/gps.conf:system/etc/gps.conf \
    $(LOCAL_PATH)/gps/izat.conf:system/etc/izat.conf \
    $(LOCAL_PATH)/gps/sap.conf:system/etc/sap.conf

# Graphics
PRODUCT_PACKAGES += \
    copybit.msm8960 \
    gralloc.msm8960 \
    hwcomposer.msm8960 \
    libgenlock \
    liboverlay

# Input device config
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/idc/y8c20x66a-rmi-ts.idc:system/usr/idc/y8c20x66a-rmi-ts.idc

# Keyhandler
PRODUCT_PACKAGES += \
    ConfigPanel

# Keylayouts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/atmel_mxt_ts.kl:system/usr/keylayout/atmel_mxt_ts.kl \
    $(LOCAL_PATH)/keylayout/cyttsp-i2c.kl:system/usr/keylayout/cyttsp-i2c.kl \
    $(LOCAL_PATH)/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    $(LOCAL_PATH)/keylayout/keypad_8960.kl:system/usr/keylayout/keypad_8960.kl

# Keystore
PRODUCT_PACKAGES += \
    keystore.msm8960

# Lights
PRODUCT_PACKAGES += \
    lights.msm8960

# Media profile
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml

# NFC packages
ifeq ($(TARGET_BUILD_VARIANT),user)
    NFCEE_ACCESS_PATH := $(LOCAL_PATH)/configs/nfcee_access.xml
else
    NFCEE_ACCESS_PATH := $(LOCAL_PATH)/configs/nfcee_access_debug.xml
endif
PRODUCT_COPY_FILES += \
    $(NFCEE_ACCESS_PATH):system/etc/nfcee_access.xml

PRODUCT_PACKAGES += \
    nfc.msm8960 \
    libnfc \
    libnfc_jni \
    Nfc \
    Tag \
    com.android.nfc_extras

# OMX
PRODUCT_PACKAGES += \
    libc2dcolorconvert \
    libdivxdrmdecrypt \
    libOmxCore \
    libOmxVdec \
    libOmxVenc \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxEvrcEnc \
    libOmxQcelp13Enc \
    libstagefrighthw

# Power
PRODUCT_PACKAGES += \
    power.msm8960

# QRNGD
PRODUCT_PACKAGES += qrngd

# Radio
PRODUCT_PACKAGES += \
    OppoNvProcess \
    OppoRadioShutdown \
    qcnvitems \
    qcnvitems.xml \
    qcrilhook \
    qcrilhook.xml \
    qcrilmsgtunnel

# Thermal config
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/thermald-8064-N1.conf:system/etc/thermald.conf \
    $(LOCAL_PATH)/configs/thermal-engine-8064.conf:system/etc/thermal-engine.conf

# Torch
PRODUCT_PACKAGES += \
    Torch

# USB
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# WiFi
PRODUCT_COPY_FILES += \
    device/oppo/n1/wifi/WCNSS_cfg.dat:system/vendor/firmware/wlan/prima/WCNSS_cfg.dat \
    device/oppo/n1/wifi/WCNSS_qcom_cfg.ini:system/etc/wifi/WCNSS_qcom_cfg.ini \
    device/oppo/n1/wifi/WCNSS_qcom_wlan_nv.bin:system/etc/wifi/WCNSS_qcom_wlan_nv.bin \
    device/oppo/n1/wifi/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf \
    device/oppo/n1/wifi/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf

PRODUCT_PACKAGES += \
    wcnss_service \
    crda \
    regulatory.bin \
    linville.key.pub.pem \
    libwfcu \
    conn_init \
    WCNSS_qcom_cfg.ini \
    WCNSS_qcom_wlan_nv.bin

# Init logos
PRODUCT_PACKAGES += \
    at.rle \
    fastboot.rle \
    initlogo.rle \
    tpupdate.rle \
    wlan.rle

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp

# System properties
PRODUCT_PROPERTY_OVERRIDES += \
    com.qc.hardware=true \
    debug.egl.hw=1 \
    debug.mdpcomp.logs=0 \
    debug.sf.hw=1 \
    persist.hwc.mdpcomp.enable=true \
    persist.gps.qmienabled=true \
    persist.thermal.monitor=true \
    persist.timed.enable=true \
    ro.baseband.arch=mdm \
    ro.opengles.version=196608 \
    ro.product.wireless=WCN3660 \
    ro.qualcomm.bt.hci_transport=smd \
    ro.use_data_netmgrd=true \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=15

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.compass.xml \
    frameworks/base/nfc-extras/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/com.nxp.mifare.xml:system/etc/permissions/com.nxp.mifare.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi xxhdpi
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# call dalvik heap config
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-2048-dalvik-heap.mk)

# call hwui memory config
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-2048-hwui-memory.mk)

# call the proprietary setup
$(call inherit-product-if-exists, vendor/oppo/n1/n1-vendor.mk)
