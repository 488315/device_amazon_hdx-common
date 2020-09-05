#
# Copyright 2012 The Android Open Source Project
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

LOCAL_PATH := $(call my-dir)

ifeq ($(BOARD_HAVE_BLUETOOTH_QCOM),true)

include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
        src/bt_vendor_qcom.c \
        src/hci_uart.c \
        src/hw_ar3k.c

LOCAL_C_INCLUDES += \
        $(LOCAL_PATH)/include \
        external/bluetooth/bluedroid/hci/include \
        system/bt/hci/include \
        $(TARGET_OUT_HEADERS)/bt/hci_qcomm_init

ifeq ($(BOARD_HAS_QCA_BT_AR3002), true)
LOCAL_C_FLAGS := \
        -DBT_WAKE_VIA_PROC
endif #BOARD_HAS_QCA_BT_AR3002

ifeq ($(BOARD_USE_EXTERNAL_RFKILL_LDO), true)
LOCAL_C_FLAGS := \
        -DUSE_EXTERNAL_RFKILL_LDO
endif #BOARD_USE_EXTERNAL_RFKILL_LDO

ifeq ($(WIFI_BT_STATUS_SYNC), true)
LOCAL_CFLAGS += -DWIFI_BT_STATUS_SYNC
endif #WIFI_BT_STATUS_SYNC

LOCAL_SHARED_LIBRARIES := \
        libcutils \
        liblog

LOCAL_MODULE := libbt-vendor
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_OWNER := qcom

ifdef TARGET_2ND_ARCH
LOCAL_MODULE_PATH_32 := $(TARGET_OUT_VENDOR)/lib
LOCAL_MODULE_PATH_64 := $(TARGET_OUT_VENDOR)/lib64
else
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)
endif

include $(BUILD_SHARED_LIBRARY)

endif # BOARD_HAVE_BLUETOOTH_QCOM
