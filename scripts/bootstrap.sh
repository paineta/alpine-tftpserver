#!/bin/sh
adduser -s /sbin/nologin -DH -u ${TFTP_NOBODYID} nobody
if [ ! -z "${TFTP_OPTIONS}" ];then
   in.tftpd ${TFTP_OPTIONS} ${TFTP_EXTRAS} ${*} /tftproot
else
   echo "need TFTP_OPTIONS"
   exit 1
fi
