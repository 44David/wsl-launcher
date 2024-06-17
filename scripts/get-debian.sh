sudo service start docker

docker run -t debian bash ls /

dockerContainerID=$(docker container ls -a | grep -i debian | awk '{print $1}')

docker export $dockerContainerID > /mnt/c/temp/debian.tar
