FROM alpine:latest
RUN apk add tftp-hpa
RUN apk add tzdata
RUN deluser nobody
RUN mkdir /tftproot
COPY scripts/bootstrap.sh /
RUN chmod 700 /bootstrap.sh
ENV TFTP_OPTIONS="-L -B 1468 -s"
ENV TFTP_EXTRAS=
ENV TFTP_NOBODYID=99
ENV TIMEZONE=
EXPOSE 69/udp
ENTRYPOINT ["./bootstrap.sh"]
