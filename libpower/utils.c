/*
 * Copyright (C) 2024 The LineageOS Project
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#define LOG_NIDEBUG 0
#define LOG_TAG "HI3635 PowerHAL"

#include <dlfcn.h>
#include <fcntl.h>
#include <errno.h>
#include <string.h>
#include <stdlib.h>
#include <sys/stat.h>

#include "utils.h"

#include <utils/Log.h>

int sysfs_write_str(char *path, char *s)
{
    char buf[80];
    int len;
    int ret = 0;
    int fd = open(path, O_WRONLY);

    if (fd < 0) {
        strerror_r(errno, buf, sizeof(buf));
        ALOGE("Error opening %s: %s\n", path, buf);
        return -1 ;
    }

    len = write(fd, s, strlen(s));
    if (len < 0) {
        strerror_r(errno, buf, sizeof(buf));
        ALOGE("Error writing to %s: %s\n", path, buf);

        ret = -1;
    }

    close(fd);

    return ret;
}

int sysfs_write_int(char *path, int value)
{
    char buf[80];
    snprintf(buf, 80, "%d", value);
    return sysfs_write_str(path, buf);
}