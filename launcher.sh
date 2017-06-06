#!/bin/bash

WORKSPACE_DIR=$(cd ..; pwd)
IMAGE_NAME="cast_match"
CONTAINER_NAME="cast_match"

function clean_containers() {
  docker rm $(docker ps -a -q)
}

function clean_images() {
  docker rmi $(docker images -a |grep -v base |awk 'NR>1{print $3}')
}

case "$1" in
"build")
  docker build -t ${IMAGE_NAME} .
  ;;
"start")
 docker run -d --privileged -it -v ${WORKSPACE_DIR}:/data/cast_match -p 8001:8001 -p 20022:22 -p 3306:3306 --name ${CONTAINER_NAME} ${IMAGE_NAME} /usr/sbin/init
 #docker run -d -it --name ${CONTAINER_NAME} ${IMAGE_NAME} /bin/bash

 docker start ${CONTAINER_NAME}
 ;;
"attach")
  docker exec -it ${CONTAINER_NAME} /bin/bash
  #docker attach ${CONTAINER_NAME}
  ;;
"stop")
  if [ $# -ge 3 ];
  then
    docker stop $2
  else
    docker stop $(docker ps -a -q)
  fi
  ;;
"clean_containers")
    clean_containers
  ;;
"clean_images")
    clean_images
  ;;
"clean_all")
    clean_containers
    clean_images
  ;;
esac
