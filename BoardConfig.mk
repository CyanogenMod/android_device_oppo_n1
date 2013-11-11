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

BOARD_VENDOR := oppo

TARGET_SPECIFIC_HEADER_PATH := device/oppo/n1/include

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := MSM8960
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# Platform
TARGET_BOARD_PLATFORM := msm8960

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_ARCH_VARIANT_CPU := cortex-a9
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_CPU_VARIANT := krait
TARGET_USE_KRAIT_BIONIC_OPTIMIZATION := true

# Kernel
BOARD_KERNEL_BASE := 0x80200000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.hardware=qcom lpj=67677 user_debug=31 msm_rtb.filter=0x3F ehci-hcd.park=3 zcache
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x02000000
TARGET_KERNEL_CONFIG := cyanogenmod_n1_defconfig
TARGET_KERNEL_SOURCE := kernel/oppo/n1

# Flags
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE -DQCOM_BSP

# QCOM hardware
BOARD_USES_QCOM_HARDWARE := true
TARGET_USES_QCOM_BSP := true
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true
TARGET_QCOM_AUDIO_VARIANT := caf
TARGET_QCOM_DISPLAY_VARIANT := caf
TARGET_QCOM_MEDIA_VARIANT := caf
BOARD_USES_QC_TIME_SERVICES := true

# Audio
BOARD_HAVE_NEW_QCOM_CSDCLIENT := true
BOARD_USES_ALSA_AUDIO := true
BOARD_USES_FLUENCE_FOR_VOIP := true
BOARD_USES_FLUENCE_INCALL := true
BOARD_USES_SEPERATED_AUDIO_INPUT := true
BOARD_USES_SEPERATED_VOICE_SPEAKER := true
TARGET_USES_QCOM_COMPRESSED_AUDIO := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/oppo/n1/bluetooth

# Camera
COMMON_GLOBAL_CFLAGS += -DDISABLE_HW_ID_MATCH_CHECK

# GPS
BOARD_HAVE_NEW_QC_GPS := true

# Graphics
BOARD_EGL_CFG := device/oppo/n1/configs/egl.cfg
USE_OPENGL_RENDERER := true
TARGET_DISPLAY_USE_RETIRE_FENCE := true
TARGET_USES_C2D_COMPOSITION := true
TARGET_USES_ION := true

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# Power
TARGET_USES_CM_POWERHAL := true

# Radio
BOARD_PROVIDES_LIBRIL := true
BOARD_RIL_NO_CELLINFOLIST := true

# Tuning
BOARD_HARDWARE_CLASS := device/oppo/n1/cmhw

# Webkit
ENABLE_WEBGL := true
TARGET_FORCE_CPU_UPLOAD := true

# Wifi
BOARD_HAS_QCOM_WLAN              := true
BOARD_WLAN_DEVICE                := qcwcn
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_qcwcn
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_qcwcn
WIFI_DRIVER_FW_PATH_STA          := "sta"
WIFI_DRIVER_FW_PATH_AP           := "ap"

# Init
BOARD_CHARGER_ENABLE_SUSPEND := true

# Filesystem
BOARD_BOOTIMAGE_PARTITION_SIZE     := 10485760
BOARD_CACHEIMAGE_PARTITION_SIZE    := 536870912
BOARD_PERSISTIMAGE_PARTITION_SIZE  := 8388608
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 10485760
BOARD_SYSTEMIMAGE_PARTITION_SIZE   := 1073741824
BOARD_USERDATAIMAGE_PARTITION_SIZE := 3221209088  # 3221209088 - 16384 for crypto footer
BOARD_FLASH_BLOCK_SIZE             := 131072

# TARGET_BOOTIMG_SIGNED := true
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PERSISTIMAGE_FILE_SYSTEM_TYPE := ext4

# Recovery
ifeq ($(WITH_SIMPLE_RECOVERY),true)
    TARGET_RECOVERY_FSTAB := device/oppo/n1/recovery.fstab
else
    TARGET_RECOVERY_FSTAB := device/oppo/n1/rootdir/etc/fstab.qcom
endif
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_23x41.h\"
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_RECOVERY_SWIPE := true

# SELinux
BOARD_SEPOLICY_DIRS += device/oppo/n1/sepolicy
BOARD_SEPOLICY_UNION += \
    file_contexts \
    property_contexts \
    te_macros \
    bluetooth_loader.te \
    bridge.te \
    camera.te \
    conn_init.te \
    device.te \
    dhcp.te \
    domain.te \
    drmserver.te \
    file.te \
    kickstart.te \
    init.te \
    mediaserver.te \
    mpdecision.te \
    netmgrd.te \
    property.te \
    qmux.te \
    rild.te \
    rmt.te \
    sensors.te \
    surfaceflinger.te \
    system.te \
    tee.te \
    thermald.te \
    ueventd.te \
    wpa_supplicant.te

# Vold
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
BOARD_VOLD_MAX_PARTITIONS := 36

TARGET_RELEASETOOLS_EXTENSIONS := device/oppo/n1

# inherit from the proprietary version
-include vendor/oppo/n1/BoardConfigVendor.mk
