cname=$(cat CONTAINER-NAME)
docker run ${*} -it --rm --network bridge -v /data/shared:/data/shared ${cname}
