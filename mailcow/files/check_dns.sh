#!/bin/bash
# check the dns

### variables ###
dns="mail.privatundfrei.de"
servicedns="DNS"
servicereversedns="DNS_reverse"

### main ###
ipaddress=$(ip -4 addr show eth0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}')

#### dns
nslookup mail.privatundfrei.de |grep ${ipaddress} > /dev/null 2>&1

if [ "$?" != "0" ]
then
  status=1
  statustext="wrong dns"
else
  status=0
  statustext="correct dns"
fi

echo "$status $servicedns - $statustext"

#### reverse dns
host ${ipaddress} | grep ${dns} > /dev/null 2>&1

if [ "$?" != "0" ]
then
  status=1
  statustext="wrong reverse dns"
else
  status=0
  statustext="correct reverse dns"
fi

echo "$status $servicereversedns - $statustext"