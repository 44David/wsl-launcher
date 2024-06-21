

# # installs WSL if an error is thrown 

if [ wsl < "$0" ]
    then
        wsl --install
        wsl -d Ubuntu

fi 

if [ $OSTYPE == "linux-gnu"* ] && [ $? -eq 0 ]
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



if [ $? -eq 0 ]
    then 

        sudo service start docker

        if [ -z $1 ]
            then 
                echo "No distribution found with given argument!"
        elif [ -n $1 ]
            then 
                distro = $1
        fi

        case $distro in
            "debian") 
                docker run -t debian bash ls /
                dockerContainerID=$(docker container ls -a | grep -i debian | awk '{print $1}')
                docker export $dockerContainerID > /mnt/c/temp/debian.tar;;
                bash ./boot-distro.sh docker
            "centos")
                docker run -t centos bash ls /
                dockerContainerID=$(docker container ls -a | grep -i centos | awk '{print $1}')
                docker export $dockerContainerID > /mnt/c/temp/centos.tar;;
                bash ./boot-distro.sh docker
            "ubuntu") 
                docker run -t centos bash ls /
                dockerContainerID=$(docker container ls -a | grep -i ubuntu | awk '{print $1}')
                docker export $dockerContainerID > /mnt/c/temp/ubuntu.tar;;
                bash ./boot-distro.sh docker
            *) 
                echo "an unexpected error occured"


