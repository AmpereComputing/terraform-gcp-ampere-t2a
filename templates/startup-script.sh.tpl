#!/bin/bash

if ! type cloud-init > /dev/null 2>&1 ; then
  echo "Ran - `date`" >> /root/startup
  sleep 30
  YUM=$(which yum)
  APT=$(which apt-get)
  if [ $YUM ]; then
    $YUM install -y cloud-init
  elif [ $APT ]; then
    $APT install -y cloud-init
  else
    echo "Yum and Apt not found"
  fi

  if [ $? == 0 ]; then
    echo "Ran - Success - `date`" >> /root/startup
    systemctl enable cloud-init
    #systemctl start cloud-init
  else
    echo "Ran - Fail - `date`" >> /root/startup
  fi

  # Reboot either way
  reboot
fi
