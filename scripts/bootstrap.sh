#!/bin/sh
# set timezone if provided, e.g. America/Chicago
if [ ! -z "${TIMEZONE}" ] && [ -e "/usr/share/zoneinfo/${TIMEZONE}" ];then
   echo -e "=== setting timezone to ${TIMEZONE}"
   cp /usr/share/zoneinfo/${TIMEZONE} /etc/localtime
   echo "${TIMEZONE}" > /etc/timezone
fi
grep ^nobody /etc/passwd > /dev/null
if [ "$?" != "0" ];then
   adduser -s /sbin/nologin -DH -u ${TFTP_NOBODYID} nobody
fi
if [ -e "/remap" ];then
   TFTP_REMAP="-m /remap"
   echo -e "=== $(date) using map:\n$(cat /remap)\n==="
fi
if [ ! -z "${TFTP_OPTIONS}" ];then
   echo -e "=== tftproot\n$(ls -la /tftproot)\n"
   cmd="in.tftpd ${TFTP_OPTIONS} ${TFTP_EXTRAS} ${TFTP_REMAP} ${*} /tftproot"
   echo -e "=== daemon\n${cmd}\n"
   ${cmd}
else
   echo "need TFTP_OPTIONS"
   exit 1
fi
