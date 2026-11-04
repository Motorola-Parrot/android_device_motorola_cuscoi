#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# API Level
BOARD_SHIPPING_API_LEVEL := 31
PRODUCT_SHIPPING_API_LEVEL := 34

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio/mixer_paths_parrot_qrd.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_parrot/mixer_paths_parrot_qrd.xml \
    $(LOCAL_PATH)/configs/audio/resourcemanager_parrot_qrd.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_parrot/resourcemanager_parrot_qrd.xml \
    $(LOCAL_PATH)/configs/audio/audio_module_config_primary.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/audio_module_config_primary.xml \
    $(LOCAL_PATH)/configs/audio/audio_ext_spkr.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_ext_spkr.conf \
    $(LOCAL_PATH)/configs/audio/usecaseKvManager.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usecaseKvManager.xml

# Boot animation
TARGET_SCREEN_HEIGHT := 2400
TARGET_SCREEN_WIDTH := 1080

# Init
PRODUCT_PACKAGES += \
    init.mmi.overlay.rc \
    init.oem.fingerprint2.sh

# Screen
TARGET_SCREEN_DENSITY := 400

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# VINTF
ODM_MANIFEST_SKUS += b be bn d de dn
ODM_MANIFEST_B_FILES := $(LOCAL_PATH)/configs/vintf/sku/manifest_b.xml
ODM_MANIFEST_BE_FILES := $(LOCAL_PATH)/configs/vintf/sku/manifest_be.xml
ODM_MANIFEST_BN_FILES := $(LOCAL_PATH)/configs/vintf/sku/manifest_bn.xml
ODM_MANIFEST_D_FILES := $(LOCAL_PATH)/configs/vintf/sku/manifest_d.xml
ODM_MANIFEST_DE_FILES := $(LOCAL_PATH)/configs/vintf/sku/manifest_de.xml
ODM_MANIFEST_DN_FILES := $(LOCAL_PATH)/configs/vintf/sku/manifest_dn.xml

# Wi-Fi
TARGET_WIFI_VARIANTS := adrastea

# Inherit from motorola sm6450-common
$(call inherit-product, device/motorola/sm6450-common/common.mk)

# Vendor
$(call inherit-product, vendor/motorola/cuscoi/cuscoi-vendor.mk)
