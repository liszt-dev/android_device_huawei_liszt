/*
 * Copyright (C) 2024 The LineageOS Project
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#include <fstream>
#include <string>

#include "vendor_init.h"
#include "property_service.h"
#include "log.h"
#include "util.h"

#include "init_hi3635.h"

void init_target_properties()
{
    std::ifstream fin;
    std::string buf;

    fin.open("/sys/firmware/devicetree/base/hisi,boardname");
    while (getline(fin, buf))
        if ((buf.find("A01L") != std::string::npos) || (buf.find("A01W") != std::string::npos))
            break;
    fin.close();

    // Google Play certification
    property_set("ro.build.description", "MOZART-user 6.0 MRA58K eng.huawei.20161129.130256 test-keys");
    property_set("ro.build.fingerprint", "Huawei/MOZART/hi3635:6.0/MRA58K/huawei11291304:user/test-keys");

    if (buf.find("A01L") != std::string::npos) {
        property_set("ro.product.model", "M2-A01L");
    }
    else if (buf.find("A01W") != std::string::npos) {
        property_set("ro.product.model", "M2-A01W");
    }
    else {
	property_set("ro.product.model", "MediaPad M2 10.0");
    }
}