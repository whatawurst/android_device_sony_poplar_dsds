#
# Copyright (C) 2017 The LineageOS Project
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

### INHERIT FROM YOSHINO-COMMON
include device/sony/yoshino-common/BoardConfigPlatform.mk
include vendor/sony/poplar_dsds/BoardConfigVendor.mk

DEVICE_PATH := device/sony/poplar_dsds

PRODUCT_PLATFORM := yoshino

### BOOTLOADER
TARGET_BOOTLOADER_BOARD_NAME := G8342

### KERNEL
TARGET_KERNEL_CONFIG := lineage-msm8998-yoshino-poplar_dsds_defconfig

BOARD_KERNEL_CMDLINE += androidboot.hardware=poplar_dsds

### PARTITIONS
# See also /proc/partitions on the device
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_CACHEIMAGE_PARTITION_SIZE := 398458880
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 5242880000
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
# Reserve space for data encryption (55743832064-16384)
BOARD_USERDATAIMAGE_PARTITION_SIZE := 55743799296

# Build vendor.img
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor
BOARD_VENDORIMAGE_PARTITION_SIZE := 1610612736

### DISPLAY
TARGET_SCREEN_DENSITY := 480

### LIGHTS
TARGET_PROVIDES_LIBLIGHT := true

### MODEM
BOARD_MODEM_CUSTOMIZATIONS := true

### IMS
BOARD_IMS_CAMERA := true

### HIDL
DEVICE_MANIFEST_FILE := $(DEVICE_PATH)/manifest.xml

### VNDK
BOARD_VNDK_VERSION := current

### SYSTEM PROPS
# Add device-specific ones
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop
