#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := icu55.c
LOCAL_SHARED_LIBRARIES := libicuuc libicui18n
LOCAL_MODULE := libshim_icu
LOCAL_MODULE_TAGS := optional
LOCAL_MULTILIB := both
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := gui.cpp
LOCAL_SHARED_LIBRARIES := libgui
LOCAL_MODULE := libshim_gui
LOCAL_MODULE_TAGS := optional
LOCAL_MULTILIB := both
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := log.c
LOCAL_MODULE := libshim_log
LOCAL_MODULE_TAGS := optional
LOCAL_MULTILIB := both
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := wvm.cpp
LOCAL_C_INCLUDES += frameworks/av
LOCAL_SHARED_LIBRARIES := libmedia libstagefright_foundation
LOCAL_MODULE := libshim_wvm
LOCAL_MODULE_TAGS := optional
include $(BUILD_SHARED_LIBRARY)