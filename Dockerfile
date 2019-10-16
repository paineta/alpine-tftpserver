FROM alpine:latest
RUN apk add tftp-hpa
RUN mkdir /tftproot
COPY scripts/bootstrap.sh /
RUN chmod 700 /bootstrap.sh
ENV TFTPBLOCKSIZE=1468
EXPOSE 69/udp
ENTRYPOINT ["./bootstrap.sh"]
