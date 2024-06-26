instance=$1 
targz=$2
path=$3

echo "$instance"
echo "$targz"
echo "$path"

mkdir -p "$path"

wsl --import "$instance" "$path" "$targz"

