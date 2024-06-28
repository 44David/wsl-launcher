instance=$1 
isofile=$2 
dir=$3 
 
 
docker 
 
if [ $? -ne 0 ] 
    then 
        echo "You do not have docker installed, please install it." 

# containerize .ISO in order to properly compress it for WSL 
docker container create -i -t --name "$instance" alpine 
 
docker container export "$instance" > "$instance".tar 

mkdir -p "$dir" 
 
docker 