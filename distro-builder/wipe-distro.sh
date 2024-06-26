wsl -v 

distro=$1

if [ $? -ne 0 ]
    then 
        ech "WSL is not installed"
fi

echo "Are you sure you would like to uninstall "$distro"? [Y/n]" 

read varanswer

if [ $varanswer == "Y" ] || [ $varanswer == "y" ]
    then 
        wsl --unregister "$distro"
else 
    echo "Script was stopped by user."