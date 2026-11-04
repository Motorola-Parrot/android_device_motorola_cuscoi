#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from cuscoi device
$(call inherit-product, device/motorola/cuscoi/device.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

PRODUCT_NAME := lineage_cuscoi
PRODUCT_DEVICE := cuscoi
PRODUCT_MANUFACTURER := motorola
PRODUCT_BRAND := motorola
PRODUCT_MODEL := motorola moto edge 50 fusion

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="cuscoi_g-user 16 W1UUIS36H.110-51-1-4 542c5-08ffa9 release-keys" \
    BuildFingerprint=motorola/cuscoi_g/cuscoi:16/W1UUIS36H.110-51-1-4/542c5-08ffa9:user/release-keys \
    DeviceName=cuscoi \
    DeviceProduct=cuscoi_g \
    SystemDevice=cuscoi \
    SystemName=cuscoi_g

PRODUCT_GMS_CLIENTID_BASE := android-motorola
