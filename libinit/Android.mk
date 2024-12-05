#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE_TAGS := optional
LOCAL_C_INCLUDES := system/core/init
LOCAL_CFLAGS := -Wall
LOCAL_SRC_FILES := init_hi3635.cpp
ifneq ($(TARGET_LIBINIT_DEFINES_FILE),)
  LOCAL_SRC_FILES += ../../../../$(TARGET_LIBINIT_DEFINES_FILE)
endif
LOCAL_MODULE := libinit_liszt
include $(BUILD_STATIC_LIBRARY)