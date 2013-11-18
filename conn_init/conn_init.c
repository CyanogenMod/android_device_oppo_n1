/*
 * Copyright 2012 The Android Open Source Project
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
#include <stdio.h>
#include <string.h>
#include <unistd.h>

#include "wfc_util_log.h"
#include "cutils/properties.h"

#define NV_ITEMS_SLEEP_DELAY 500

extern int wfc_util_qcom_check_config(unsigned char *nv_mac_addr);
extern void wfc_util_atoh(char *pAsciiString, int szAsciiString, unsigned char *pHexaBuff, int szHexaBuff);

static int wifi_check_qcom_cfg_files()
{
    char raw[13];
    char mac[7];
    int sleep_retry = 0;

    memset(raw, 0, 13);
    memset(mac, 0, 7);

    // Read MAC String
    FILE *fp = NULL;
    int n = 0;
    while (fp == NULL && sleep_retry < 200) {
        fp = fopen("/data/opponvitems/4678", "r");
        if (fp == NULL) {
            wfc_util_log_info("NV items not ready, sleep %dms", NV_ITEMS_SLEEP_DELAY);
            usleep(NV_ITEMS_SLEEP_DELAY * 1000);
            sleep_retry++;
        }
    }

    if (fp == NULL) {
        wfc_util_qcom_check_config((unsigned char *)raw);
        property_set("wlan.driver.status", "failed");
        return 0;

    } else {

        n = fread(raw, 6, 1, fp);
        fclose(fp);

        // swap bytes
        mac[0] = raw[5];
        mac[1] = raw[4];
        mac[2] = raw[3];
        mac[3] = raw[2];
        mac[4] = raw[1];
        mac[5] = raw[0];

        wfc_util_qcom_check_config((unsigned char *)mac);

        property_set("wlan.driver.status", "ok");
    }
    return 1;
}

int main(void)
{
    wifi_check_qcom_cfg_files();

    return 0;
}
