#
# Copyright (C) 2023 The LineageOS Project
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

-include device/samsung/sm6150-common/BoardConfigCommon.mk

DEVICE_PATH := device/samsung/m51

# Assert
TARGET_OTA_ASSERT_DEVICE := m51

# Board
TARGET_BOARD_NAME := SRPTD22A005

# Camera
SOONG_CONFIG_NAMESPACES += samsung_sm6150CameraVars
SOONG_CONFIG_samsung_sm6150CameraVars += \
    samsung_sm6150_model

SOONG_CONFIG_samsung_sm6150CameraVars_samsung_sm6150_model := $(TARGET_DEVICE)

# Fingerprint
TARGET_SEC_FP_REQUEST_FORCE_CALIBRATE := true
TARGET_SEC_FP_REQUEST_TOUCH_EVENT := true

# GPU
TARGET_BOARD_PLATFORM_GPU := qcom-adreno618

# Init
TARGET_INIT_VENDOR_LIB := //$(DEVICE_PATH):libinit_m51
TARGET_RECOVERY_DEVICE_MODULES := libinit_m51

# Kernel
BOARD_BOOT_HEADER_VERSION := 2
TARGET_KERNEL_CONFIG := m51_defconfig
BOARD_DTB_OFFSET := 0x01F00000
BOARD_MKBOOTIMG_ARGS := --dtb_offset $(BOARD_DTB_OFFSET) --header_version $(BOARD_BOOT_HEADER_VERSION)

# Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Security Patch Level
VENDOR_SECURITY_PATCH := 2023-07-01

# Sepolicy
BOARD_VENDOR_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor

# Get non-open-source specific aspects
include vendor/samsung/m51/BoardConfigVendor.mk
