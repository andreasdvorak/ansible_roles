#!/bin/bash
# Removing old kernels
RUNNING_KERNEL=$(uname -r | awk -F '-virtual' '{ print $1}')
LATEST_KERNEL=$(dpkg -l | grep linux-image | grep signed | grep ii | awk '{print $2}' | awk -F 'linux-image-' '{print $2}' | sort -V | tail -1)

if [ ! -z "$LATEST_KERNEL" ] || [ ! -z "$RUNNING_KERNEL" ]
then
  KERNEL_LIST=$(dpkg -l | grep linux-image | grep -v meta-package | awk '{print $2}' | egrep -v "$LATEST_KERNEL|$RUNNING_KERNEL")
  if [ ! -z "$KERNEL_LIST" ]
  then
    echo "removing $KERNEL_LIST"
    apt-get --purge -y remove $KERNEL_LIST
  else
    echo "Something went wrong determining the kernel list"
    exit 0
  fi
else
  echo "Something went wrong determining the kernel variables"
  exit 0
fi