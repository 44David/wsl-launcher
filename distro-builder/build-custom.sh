instance=$1 
targz=$2
folder=$3


if [ "wsl -v" < "$0" ]
    then 
        echo "You do not have WSL installed. Would you like to install and continue with installation? [Y/n]"

        read varanswer 

        if [ $varanswer == "Y" ] || [ $varanswer == "n" ]
            then 
                wsl --install 
        else
            echo "Script failed to execute"
        fi 
fi         

mkdir -p "$folder"

wsl --import "$instance" "$path" "$targz"

if [ $? -eq 0 ]
    then 
        echo "Successfully built instance. Run wsl -d "$instance" "

