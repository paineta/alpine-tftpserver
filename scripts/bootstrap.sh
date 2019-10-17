#!/bin/sh
# set timezone if provided, e.g. America/Chicago
if [ ! -z "${TIMEZONE}" ] && [ -e "/usr/share/zoneinfo/${TIMEZONE}" ];then
   echo -e "=== setting timezone to ${TIMEZONE}"
   cp /usr/share/zoneinfo/${TIMEZONE} /etc/localtime
   echo "${TIMEZONE}" > /etc/timezone
fi
adduser -s /sbin/nologin -DH -u ${TFTP_NOBODYID} nobody
if [ -e "/remap" ];then
   TFTP_REMAP="-m /remap"
   echo -e "=== $(date) using map:\n$(cat /remap)\n==="
fi
if [ ! -z "${TFTP_OPTIONS}" ];then
   echo -e "=== file structure\n$(ls -laR /tftproot)"
   in.tftpd ${TFTP_OPTIONS} ${TFTP_EXTRAS} ${TFTP_REMAP} ${*} /tftproot
else
   echo "need TFTP_OPTIONS"
   exit 1
fi
