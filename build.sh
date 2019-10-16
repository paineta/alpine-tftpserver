cname=$(cat CONTAINER-NAME)
tags="latest"
for t in ${tags};do
  TAGS="${TAGS} -t ${cname}:${t}"
done
docker build ${TAGS} .
