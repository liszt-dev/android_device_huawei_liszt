#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_C_INCLUDES := system/core/init
LOCAL_SHARED_LIBRARIES := liblog libcutils
LOCAL_SRC_FILES := power_liszt.c utils.c
LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_MODULE := power.$(TARGET_BOARD_PLATFORM)
LOCAL_MODULE_TAGS := optional
include $(BUILD_SHARED_LIBRARY)