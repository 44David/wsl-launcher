docker >/dev/null 2>&1


if [ $? -ne 0 ]
    then 
        sudo apt-get -y -q update
        sudo apt-get install ca-certificates curl gnupg cdebootstrap debian-arch-keyring tar
        sudo install -m 0755 -d /etc/apt/keyrings
        sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
        sudo chmod a+r /etc/apt/keyrings/docker.asc

        echo \
        "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
        $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
        sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
        sudo apt-get -y -q update

        sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

        sudo docker run hello-world
fi


sudo service docker start >/dev/null 2>&1

case "$1" in
    "Debian")  
        echo "Installing Debian"
        docker run -t debian bash ls /
        dockerContainerID=$(docker container ls -a | grep -i debian | awk '{print $1}')
        docker export $dockerContainerID > /mnt/c/Users/David/Onedrive/Desktop/debian.tar;;              
    "centos")
        docker run -t centos bash ls /
        dockerContainerID=$(docker container ls -a | grep -i centos | awk '{print $1}')
        docker export $dockerContainerID > /mnt/c/Users/David/Onedrive/Desktop/centos.tar;;
    "archlinux") 
        if "scoop update"; then 
            scoop bucket add extras 
            scoop install archwsl 
        else
            "./install-scoop.ps1"
            scoop bucket add extras 
            scoop install archwsl 

esac 