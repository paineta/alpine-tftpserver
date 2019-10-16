cname=$(cat CONTAINER-NAME)
cmd="docker push ${cname}"
if [ "${1}" == "go" ];then
  ${cmd}
else
  echo "use ./push.sh go"
  echo -e "\t${cmd}"
fi
