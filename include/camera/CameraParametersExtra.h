/*
 * Copyright (C) 2014 The CyanogenMod Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "camera/CameraParametersExtraDurationTimer.h"

#define CAMERA_PARAMETERS_EXTRA_C \
const char CameraParameters::KEY_SUPPORTED_ISO_MODES[] = "iso-values"; \
const char CameraParameters::ISO_AUTO[] = "auto"; \
const char CameraParameters::KEY_SUPPORTED_HFR_SIZES[] = "hfr-size-values"; \
const char CameraParameters::KEY_SUPPORTED_VIDEO_HIGH_FRAME_RATE_MODES[] = "video-hfr-values"; \
const char CameraParameters::KEY_AE_BRACKET_HDR[] = "ae-bracket-hdr"; \
const char CameraParameters::AE_BRACKET_HDR_OFF[] = "Off"; \
const char CameraParameters::AE_BRACKET_HDR[] = "HDR"; \
const char CameraParameters::SCENE_MODE_ASD[] = "asd"; \
const char CameraParameters::KEY_SCENE_DETECT[] = "scene-detect"; \
const char CameraParameters::SCENE_DETECT_ON[] = "on"; \
CAMERA_PARAMETERS_EXTRA_C_DURATION_TIMER

#define CAMERA_PARAMETERS_EXTRA_H \
    static const char KEY_SUPPORTED_ISO_MODES[]; \
    static const char ISO_AUTO[]; \
    static const char KEY_SUPPORTED_HFR_SIZES[]; \
    static const char KEY_SUPPORTED_VIDEO_HIGH_FRAME_RATE_MODES[]; \
    static const char KEY_AE_BRACKET_HDR[]; \
    static const char AE_BRACKET_HDR_OFF[]; \
    static const char AE_BRACKET_HDR[]; \
    static const char SCENE_MODE_ASD[]; \
    static const char KEY_SCENE_DETECT[]; \
    static const char SCENE_DETECT_ON[];
