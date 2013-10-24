package com.cyanogenmod.n1.configuration;

import java.util.HashMap;
import java.util.Map;

public class Constants {

    public static final String TOUCHPAD_STATE_KEY = "touchpad_enable_state";
    public static final String TOUCHPAD_LONG_PRESS_STATE_KEY = "touchpad_long_click_state";
    public static final String TOUCHPAD_DOUBLE_CLICK_STATE_KEY = "touchpad_double_tap_state";

    public static final String TOUCH_PAD_NODE = "/proc/touchpad/enable";

    public static final String TOUCHSCREEN_DOUBLE_TAP_GESTURE = "touchscreen_gesture_double_tap";
    public static final String TOUCHSCREEN_CAMERA_GESTURE = "touchscreen_gesture_camera";
    public static final String TOUCHSCREEN_MUSIC_GESTURE = "touchscreen_gesture_music";
    public static final String TOUCHSCREEN_FLASHLIGHT_GESTURE = "touchscreen_gesture_flashlight";

    public static final String TOUCHSCREEN_DOUBLE_TAP_NODE = "/proc/touchpanel/double_tap_enable";
    public static final String TOUCHSCREEN_CAMERA_NODE = "/proc/touchpanel/camera_enable";
    public static final String TOUCHSCREEN_MUSIC_NODE = "/proc/touchpanel/music_enable";
    public static final String TOUCHSCREEN_FLASHLIGHT_NODE = "/proc/touchpanel/flashlight_enable";

    public static final Map<String, String> sNodePreferenceMap = new HashMap<String, String>();
    static {
        sNodePreferenceMap.put(TOUCHPAD_STATE_KEY, TOUCH_PAD_NODE);

        sNodePreferenceMap.put(TOUCHSCREEN_DOUBLE_TAP_GESTURE, TOUCHSCREEN_DOUBLE_TAP_NODE);
        sNodePreferenceMap.put(TOUCHSCREEN_CAMERA_GESTURE, TOUCHSCREEN_CAMERA_NODE);
        sNodePreferenceMap.put(TOUCHSCREEN_MUSIC_GESTURE, TOUCHSCREEN_MUSIC_NODE);
        sNodePreferenceMap.put(TOUCHSCREEN_FLASHLIGHT_GESTURE, TOUCHSCREEN_FLASHLIGHT_NODE);
    }
}
