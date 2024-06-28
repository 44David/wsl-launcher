instance=$1 
isofile=$2 
dir=$3 
 
 
docker 
 
if [ $? -ne 0 ] 
    then 
        echo "You do not have docker installed, please install it." 
fi


cat <<EOF > Dockerfile
FROM scratch 
COPY "$isofile"
RUN mkdir "$instance"-container 

EOF

docker build -t "$instance"-container .

docker run name "$instance" "$instance"-container

docker export "$instance" -o "$instance".tar

wsl --import 