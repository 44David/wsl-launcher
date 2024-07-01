instance=$1 
isofile=$2 
  
docker >/dev/null 2>&1

sudo service docker start >/dev/null 2>&1
 
if [ $? -ne 0 ] 
    then 
        echo "You do not have docker installed, please install it." 
fi

mkdir "$instance"-vhdx-storage

cat <<EOF > Dockerfile
FROM scratch 
COPY "$isofile"
EOF

echo "Building... (This may take several minutes)"

docker build -t "$instance"-container .

docker run name "$instance" "$instance"-container

docker export "$instance" -o "$instance".tar
