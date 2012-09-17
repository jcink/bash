#!/bin/sh

# ---------------------------------------------------
# Email SMART test logs weekly, daily, hourly, etc
# ---------------------------------------------------

# Error Reporting
HARD_DRIVE_ERRORS_SDA=`smartctl -l error /dev/sda`;
HARD_DRIVE_ERRORS_SDB=`smartctl -l error /dev/sdb`;

# Health Reporting
HARD_DRIVE_HEALTH_SDA=`smartctl -H /dev/sda`;
HARD_DRIVE_HEALTH_SDB=`smartctl -H /dev/sdb`;

# Data Reporting
HARD_DRIVE_DATA_SDA=`smartctl -A /dev/sda`;
HARD_DRIVE_DATA_SDB=`smartctl -A /dev/sdb`;

MACHINE=`uname -a`
THEDATE=`date +%Y-%m-%d`

echo -e "Subject: Hard Drive Report ( $THEDATE )\n\n\nHard drive reports are in. View them below.

Machine: $MACHINE

--------------------------------------------------------
(DISK #1) Error log, health, and data for: /dev/sda
--------------------------------------------------------

$HARD_DRIVE_ERRORS_SDA
$HARD_DRIVE_HEALTH_SDA
$HARD_DRIVE_DATA_SDA

--------------------------------------------------------
(DISK #2) Error log, health, and data for: /dev/sdb
--------------------------------------------------------

$HARD_DRIVE_ERRORS_SDB
$HARD_DRIVE_HEALTH_SDB
$HARD_DRIVE_DATA_SDB

------- End of Reports -------- " | sendmail -v you@example.com
echo "comeplete";