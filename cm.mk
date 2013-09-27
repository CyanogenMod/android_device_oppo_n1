$(call inherit-product, device/oppo/n1/full_n1.mk)

# Inherit some common CM stuff
$(call inherit-product, vendor/cm/config/gsm.mk)

# Enhanced NFC
$(call inherit-product, vendor/cm/config/nfc_enhanced.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

PRODUCT_NAME := cm_n1
PRODUCT_DEVICE := n1

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=occam BUILD_FINGERPRINT=OPPO/oppo_130922/N1:4.2.2/JDQ39/182448:user/release-keys PRIVATE_BUILD_DESC="msm8960-user 4.2.2 JDQ39 eng.oppo.20130922.182448 release-keys"
