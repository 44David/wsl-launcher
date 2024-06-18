
# for now, assuming debian-based architecture 


if [ $OSTYPE == "linux-gnu"* ]
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

# mac os
elif [ $OSTYPE == "darwin"* ]
    then 
        ech "Mac os"

fi

if [ $? -eq 0 ] && [ $OSTYPE == "linux-gnu"* ]
    then 
        sudo service start docker

        if [ -z $1 ]
            then 
                echo "No arguments provided"
        elif [ -n $1 ]
            then 
                distro = $1
        fi

        case $distro in 
            "debian") 
                docker run -t debian bash ls /
                dockerContainerID=$(docker container ls -a | grep -i debian | awk '{print $1}')
                docker export $dockerContainerID > /mnt/c/temp/debian.tar;;
                # run boot-distro.sh 
            "centos")
                docker run -t centos bash ls /
                dockerContainerID=$(docker container ls -a | grep -i centos | awk '{print $1}')
                docker export $dockerContainerID > /mnt/c/temp/centos.tar
                # run boot-distro.sh 
            *) 
                echo "an unexpected error occured"


