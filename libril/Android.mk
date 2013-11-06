# Copyright 2006 The Android Open Source Project

ifeq ($(BOARD_PROVIDES_LIBRIL),true)
ifeq ($(BOARD_VENDOR),oppo)
ifeq ($(TARGET_DEVICE),n1)

LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_SRC_FILES:= \
    ril.cpp \
    ril_event.cpp

LOCAL_SHARED_LIBRARIES := \
    liblog \
    libutils \
    libbinder \
    libcutils \
    libhardware_legacy

LOCAL_CFLAGS :=

ifeq ($(BOARD_RIL_NO_CELLINFOLIST),true)
LOCAL_CFLAGS += -DRIL_NO_CELL_INFO_LIST
endif

LOCAL_MODULE:= libril

LOCAL_LDLIBS += -lpthread

include $(BUILD_SHARED_LIBRARY)

endif # TARGET_DEVICE
endif # BOARD_VENDOR
endif # BOARD_PROVIDES_LIBRIL
