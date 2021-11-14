COMMON_FOLDER := device/amazon/hdx-common

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Get non-open-source specific aspects
$(call inherit-product-if-exists, vendor/amazon/hdx-common/hdx-common-vendor.mk)

# AOSP overlay
DEVICE_PACKAGE_OVERLAYS += $(COMMON_FOLDER)/overlay

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi
PRODUCT_AAPT_PREBUILT_DPI := xxhdpi xhdpi hdpi

# Permissions
PRODUCT_COPY_FILES += \
	external/ant-wireless/antradio-library/com.dsi.ant.antradio_library.xml:system/etc/permissions/com.dsi.ant.antradio_library.xml \
	$(COMMON_FOLDER)/amazon_tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
	frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
	frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
	frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
	frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
	frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:system/etc/permissions/android.hardware.sensor.stepcounter.xml \
	frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:system/etc/permissions/android.hardware.sensor.stepdetector.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
	frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
	frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
	frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml

# Ramdisk
PRODUCT_PACKAGES += \
	check_prov.sh \
	fstab.qcom \
	init.qcom.rc \
	init.qcom.usb.rc \
	init.class_main.sh \
	init.qcom.class_core.sh \
	init.qcom.factory.sh \
	init.qcom.sensor.sh \
	init.qcom.sh \
	init.qcom.ssr.sh \
	init.qcom.usb.sh \
	ueventd.qcom.rc \
	init.recovery.qcom.rc

# ANT+
PRODUCT_PACKAGES += \
    AntHalService \
    com.dsi.ant.antradio_library \
    libantradio

# Audio Calibration
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/acdb/MTP_Bluetooth_cal.acdb:system/etc/acdbdata/MTP/MTP_Bluetooth_cal.acdb \
    $(LOCAL_PATH)/audio/acdb/MTP_General_cal.acdb:system/etc/acdbdata/MTP/MTP_General_cal.acdb \
    $(LOCAL_PATH)/audio/acdb/MTP_Global_cal.acdb:system/etc/acdbdata/MTP/MTP_Global_cal.acdb \
    $(LOCAL_PATH)/audio/acdb/MTP_Handset_cal.acdb:system/etc/acdbdata/MTP/MTP_Handset_cal.acdb \
    $(LOCAL_PATH)/audio/acdb/MTP_Hdmi_cal.acdb:system/etc/acdbdata/MTP/MTP_Hdmi_cal.acdb \
    $(LOCAL_PATH)/audio/acdb/MTP_Headset_cal.acdb:system/etc/acdbdata/MTP/MTP_Headset_cal.acdb \
    $(LOCAL_PATH)/audio/acdb/MTP_Speaker_cal.acdb:system/etc/acdbdata/MTP/MTP_Speaker_cal.acdb

# Audio Config Files
PRODUCT_COPY_FILES += \
    frameworks/av/services/audiopolicy/config/a2dp_audio_policy_configuration.xml:system/vendor/etc/a2dp_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/audio_policy_volumes.xml:system/vendor/etc/audio_policy_volumes.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:system/vendor/etc/default_volume_tables.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:system/vendor/etc/r_submix_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:system/vendor/etc/usb_audio_policy_configuration.xml \
    $(LOCAL_PATH)/audio/audio_effects.xml:system/etc/audio_effects.xml \
    $(LOCAL_PATH)/audio/audio_platform_info.xml:system/etc/audio_platform_info.xml \
    $(LOCAL_PATH)/audio/audio_policy_configuration.xml:system/etc/audio_policy_configuration.xml \
    $(LOCAL_PATH)/audio/mixer_paths.xml:system/etc/mixer_paths.xml

# Audio Packages
PRODUCT_PACKAGES += \
	audiod \
	audio.a2dp.default \
	audio.primary.msm8974 \
	audio.r_submix.default \
	audio.usb.default \
	libaudio-resampler \
	tinymix

# Audio effects
PRODUCT_PACKAGES += \
	libqcompostprocbundle \
	libqcomvisualizer \
	libqcomvoiceprocessing \
	libqcomvoiceprocessingdescriptors

# AptX
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/bluetooth/aptx/lib/libaptX_encoder.so:system/vendor/lib/libaptX_encoder.so \
    $(LOCAL_PATH)/bluetooth/aptx/lib/libaptXHD_encoder.so:system/vendor/lib/libaptXHD_encoder.so
    
# Media Config Files
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/media/media_profiles.xml:system/etc/media_profiles.xml \
	$(LOCAL_PATH)/media/media_codecs.xml:system/etc/media_codecs.xml \
	$(LOCAL_PATH)/media/media_codecs_performance.xml:system/etc/media_codecs_performance.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml

# Media Packages
PRODUCT_PACKAGES += \
    libc2dcolorconvert \
    libdivxdrmdecrypt \
    libextmedia_jni \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxCore \
    libOmxEvrcEnc \
    libOmxQcelp13Enc \
    libOmxVdec \
    libOmxVenc \
    libOmxVidcCommon \
    libstagefrighthw

# Keymap
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/keymap/amazon_touch.idc:system/usr/idc/amazon_touch.idc \
	$(LOCAL_PATH)/keymap/atmel_mxt_ts.kl:system/usr/keylayout/atmel_mxt_ts.kl \
	$(LOCAL_PATH)/keymap/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
	$(LOCAL_PATH)/keymap/msm8974-taiko-tablet-snd-card_JACK.kl:system/usr/keylayout/msm8974-taiko-tablet-snd-card_JACK.kl \
	$(LOCAL_PATH)/keymap/synaptics_rmi4_i2c.kl:system/usr/keylayout/synaptics_rmi4_i2c.kl \
	$(LOCAL_PATH)/keymap/Vendor_1949_Product_0402.kl:system/usr/keylayout/Vendor_1949_Product_0402.kl

# Charger
PRODUCT_PACKAGES += \
	charger \
	charger_res_images

# Filesystem management tools
PRODUCT_PACKAGES += \
	make_ext4fs \
	e2fsck \
	setup_fs

# Graphics
PRODUCT_PACKAGES += \
	copybit.msm8974 \
	gralloc.msm8974 \
	hwcomposer.msm8974 \
	memtrack.msm8974
	
# GPS
PRODUCT_PACKAGES += \
	gps.msm8974

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/gps/flp.conf:system/etc/flp.conf \
	$(LOCAL_PATH)/gps/gps.conf:system/etc/gps.conf \
	$(LOCAL_PATH)/gps/izat.conf:system/etc/izat.conf \
	$(LOCAL_PATH)/gps/lowi.conf:system/etc/lowi.conf \

# IRSC
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/etc/sec_config:system/etc/sec_config

# Lights
PRODUCT_PACKAGES += \
	lights.msm8974

# Power
PRODUCT_PACKAGES += \
	power.msm8974

# Sensors
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/sensors/sensor_def_qcomdev.conf:system/etc/sensor_def_qcomdev.conf

# WiFi
PRODUCT_PACKAGES += \
	wcnss_service \
	wpa_supplicant \
    libwpa_client \
	wpa_supplicant_overlay.conf \
	p2p_supplicant_overlay.conf \
	hostapd_default.conf \
	hostapd.accept \
	hostapd.deny \
	wlan.ko

# Misc dependencies
PRODUCT_PACKAGES += \
    ebtables \
    ethertypes \
    curl \
    libnl_2 \
    libbson \
    libcnefeatureconfig \
    libtinyxml \
    libxml2 \
	libnetcmdiface \
	libcurl

# QCOM Crypto
PRODUCT_PACKAGES += \
	libcryptfs_hw

# BT
PRODUCT_PACKAGES += \
	libbt-vendor
    
# Sensors
PRODUCT_PACKAGES += \
    sensors.msm8974

# DTB Tool
PRODUCT_PACKAGES += \
	dtbToolCM

PRODUCT_PACKAGES += \
	rild \
	libril \
	librilutils \
	libreference-ril

# ABI fixes for old binaries
PRODUCT_PACKAGES += \
	libshim_atomic \
	libshim_libbinder \
	libshim_liblog \
	libshim_libwvm \
	libshim_libcrypto \
	libshim_libgui

# Snap Camera
PRODUCT_PACKAGES += \
	Snap

# System properties
-include $(COMMON_FOLDER)/system_prop.mk

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

# We have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# call dalvik heap config
$(call inherit-product, frameworks/native/build/phone-xxhdpi-2048-dalvik-heap.mk)

# call hwui memory config
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-2048-hwui-memory.mk)

# set private bt-vendor source
$(call project-set-path-variant,bt-vendor,amazon-hdx,device/amazon/hdx-common/libbt-vendor)
