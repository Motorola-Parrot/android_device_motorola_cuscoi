#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/motorola/cuscoi

# Inherit from motorola sm6450-common
include device/motorola/sm6450-common/BoardConfigCommon.mk

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := $(PRODUCT_DEVICE)

# Display
TARGET_SCREEN_DENSITY := 400

# Partitions
BOARD_MOT_DP_GROUP_SIZE := 8313110528
BOARD_SUPER_PARTITION_SIZE := 8317304832

# Properties
TARGET_PRODUCT_PROP += $(DEVICE_PATH)/configs/properties/product.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/configs/properties/vendor.prop

# Security
BOOT_SECURITY_PATCH := 2026-09-01
VENDOR_SECURITY_PATCH := $(BOOT_SECURITY_PATCH)

# Manifest
ODM_MANIFEST_SKUS += b be bn d de dn
ODM_MANIFEST_B_FILES := $(DEVICE_PATH)/configs/vintf/sku/manifest_ese.xml $(COMMON_PATH)/configs/vintf/manifest_parrot_ss.xml
ODM_MANIFEST_BE_FILES := $(DEVICE_PATH)/configs/vintf/sku/manifest_ese.xml
ODM_MANIFEST_BN_FILES := $(DEVICE_PATH)/configs/vintf/sku/manifest_ese.xml
ODM_MANIFEST_D_FILES := $(DEVICE_PATH)/configs/vintf/sku/manifest_ese.xml
ODM_MANIFEST_DE_FILES := $(DEVICE_PATH)/configs/vintf/sku/manifest_ese.xml
ODM_MANIFEST_DN_FILES := $(DEVICE_PATH)/configs/vintf/sku/manifest_ese.xml

# Verified Boot
BOARD_AVB_ROLLBACK_INDEX := 6
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := $(BOARD_AVB_ROLLBACK_INDEX)

# Vendor
include vendor/motorola/cuscoi/BoardConfigVendor.mk
