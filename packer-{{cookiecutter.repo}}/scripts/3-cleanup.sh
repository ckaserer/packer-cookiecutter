#!/usr/bin/env bash

set -ex

if [ -f /etc/os-release ]; then
  # shellcheck disable=SC1091
  source /etc/os-release
  id=$ID
elif [ -f /etc/redhat-release ]; then
  id="$(awk '{ print tolower($1) }' /etc/redhat-release | sed 's/"//g')"
fi

if [[ $id == "fedora" ]]; then
  dnf clean all
fi

if [[ $id == "centos" ]]; then
  yum clean all
fi

# Stop rsyslog service
if [[ $id != "arch" ]]; then
  service rsyslog stop
fi

# clear audit logs
if [ -f /var/log/audit/audit.log ]; then
  bash -c "cat /dev/null > /var/log/audit/audit.log"
fi
if [ -f /var/log/wtmp ]; then
  bash -c "cat /dev/null > /var/log/wtmp"
fi
if [ -f /var/log/lastlog ]; then
  bash -c "cat /dev/null > /var/log/lastlog"
fi

# cleanup persistent udev rules
if [ -f /etc/udev/rules.d/70-persistent-net.rules ]; then
  rm /etc/udev/rules.d/70-persistent-net.rules
fi

# cleanup /tmp directories
rm -rf /tmp/*
rm -rf /var/tmp/*

# cleanup current ssh keys
rm -f /etc/ssh/ssh_host_*

# reset hostname
bash -c "cat /dev/null > /etc/hostname"

# cleanup shell history
history -w
history -c
