if [ ! -z "${TFTPROOT}" ] && [ -e ${TFTPROOT} ];then
   in.tftpd -LvB ${TFTPBLOCK} ${TFTPROOT}
else
   echo "no TFTPROOT set, or path not found ${TFTPROOT}"
   exit 1
fi
