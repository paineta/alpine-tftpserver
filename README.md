# in.tftp server Docker container

e.g. testing run
    docker run -it --rm -v /data/mytftpstore:/tftproot:ro uwectss/alpine-tftpserver

e.g. production run
    docker run --d --restart unless-stopped -v /data/mytftpstore:/tftproot:ro uwectss/alpine-tftpserver
