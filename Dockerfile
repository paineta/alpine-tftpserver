FROM alpine:latest
RUN apk add tftp-hpa
RUN mkdir /tftproot
COPY scripts/bootstrap.sh /
RUN chmod 700 /bootstrap.sh
ENV TFTP_OPTIONS="-L -B 1468 -s"
ENV TFTP_EXTRAS=
EXPOSE 69/udp
ENTRYPOINT ["./bootstrap.sh"]
