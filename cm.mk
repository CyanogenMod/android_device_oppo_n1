$(call inherit-product, device/oppo/n1/full_n1.mk)

# Inherit some common CM stuff
$(call inherit-product, vendor/cm/config/gsm.mk)

# Enhanced NFC
$(call inherit-product, vendor/cm/config/nfc_enhanced.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

PRODUCT_NAME := cm_n1
PRODUCT_DEVICE := n1

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_FINGERPRINT=OPPO/OPPO_13055/N1:4.3.1/JLS36I/b020e44cc1:user/release-keys
