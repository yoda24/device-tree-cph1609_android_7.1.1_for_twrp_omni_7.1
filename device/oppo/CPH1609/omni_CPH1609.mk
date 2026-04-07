#
# Copyright (C) 2026 The Android Open Source Project
# Copyright (C) 2026 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Omni stuff.
#$(call inherit-product, vendor/omni/config/common.mk)

# Inherit from CPH1609 device
#$(call inherit-product, device/oppo/CPH1609/device.mk)

PRODUCT_DEVICE := CPH1609
PRODUCT_NAME := omni_CPH1609
PRODUCT_BRAND := OPPO
PRODUCT_MODEL := CPH1609
PRODUCT_MANUFACTURER := oppo

PRODUCT_GMS_CLIENTID_BASE := android-oppo

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="full_oppo6750_16391-user 7.1.1 N4F26M 1513853042 release-keys"

BUILD_FINGERPRINT := OPPO/full_oppo6750_16391/oppo6750_16391:7.1.1/N4F26M/1513853042:user/release-keys
