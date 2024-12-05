#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/locales_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_m.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_tablet_wifionly.mk)

# Inherit from liszt device.
$(call inherit-product, device/huawei/liszt/device.mk)

PRODUCT_CHARACTERISTICS := tablet
PRODUCT_GMS_CLIENTID_BASE := android-huawei

PRODUCT_NAME := lineage_liszt
PRODUCT_DEVICE := liszt
PRODUCT_BRAND := huawei
PRODUCT_MANUFACTURER := Huawei
PRODUCT_MODEL := MediaPad M2 10.0