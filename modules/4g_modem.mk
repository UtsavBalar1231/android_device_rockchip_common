#
# Copyright 2021 Rockchip Limited
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

PRODUCT_PACKAGES += \
    CarrierDefaultApp \
    CarrierConfig \
    rild \
    libril \
    libreference-ril \
    usb_dongle \
    radio_dependencies \
    librk-ril \
    dhcpcd

PRODUCT_COPY_FILES += vendor/rockchip/common/phone/etc/apns-full-conf.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/apns-conf.xml

EXTRA_VENDOR_LIBRARIES += \
    android.hardware.radio@1.0 \
    android.hardware.radio@1.1 \
    android.hardware.radio@1.2 \
    android.hardware.radio@1.3 \
    android.hardware.radio@1.4 \
    android.hardware.radio@1.5 \
    android.hardware.radio@1.6 \
    android.hardware.radio.config@1.0-service \
    android.hardware.radio.config@1.0 \
    android.hardware.radio.config@1.1 \
    android.hardware.radio.config@1.2 \
    android.hardware.radio.config@1.3 \
    android.hardware.radio.deprecated@1.0 \
    android.hardware.secure_element@1.0 \
    android.hardware.secure_element@1.1 \
    android.hardware.secure_element@1.2

PRODUCT_PACKAGES += \
    android.hardware.radio@1.2-radio-service \
    android.hardware.radio.config@1.0-service

PRODUCT_PROPERTY_OVERRIDES += \
    ro.boot.noril=false \
    ro.radio.noril=false \
    ro.telephony.default_network=26 \
    persist.vendor.radio.apm_sim_not_pwdn=1 \
    persist.vendor.radio.sib16_support=1 \
    persist.vendor.radio.custom_ecc=1 \
    persist.vendor.radio.procedure_bytes=SKIP \
    persist.radio.multisim.config=ssss \
    persist.vendor.radio.rat_on=combine

DEVICE_MANIFEST_FILE += device/rockchip/common/4g_modem/manifest.xml
DEVICE_MATRIX_FILE += device/rockchip/common/4g_modem/compatibility_matrix.xml

ifeq ($(strip $(TARGET_ARCH)), arm64)
# PRODUCT_PROPERTY_OVERRIDES += \
#     vendor.rild.libpath=/vendor/lib64/librk-ril.so

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/../4g_modem/bin64/dhcpcd:$(TARGET_COPY_OUT_VENDOR)/bin/dhcpcd \
    $(LOCAL_PATH)/../4g_modem/lib64/librk-ril.so:$(TARGET_COPY_OUT_VENDOR)/lib64/librk-ril.so
else
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.rild.libpath=/vendor/lib/librk-ril.so

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/../4g_modem/bin32/dhcpcd:$(TARGET_COPY_OUT_VENDOR)/bin/dhcpcd \
    $(LOCAL_PATH)/../4g_modem/lib32/librk-ril.so:$(TARGET_COPY_OUT_VENDOR)/lib/librk-ril.so
endif
