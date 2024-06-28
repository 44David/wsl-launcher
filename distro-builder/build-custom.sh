
instance=$1 
file=$2
folder=$3




if [ $? -ne 0 ]
    then 
        echo "You do not have WSL installed. Would you like to install and continue with installation? [Y/n]"

        read varanswer 

        if [ $varanswer == "Y" ] || [ $varanswer == "y" ]
            then 
                wsl --install 
        else
            echo "Script failed to execute"
        fi 
fi         


if [ -z "$3" ]
    then 
        echo "Would you like us to automatically create a storage folder? [Y\n]"

        read makefolder

        if [ $makefolder == "Y" ] || [ $makefolder == "y" ]
            then 

            mkdir -p "$folder"

            wsl --import "$instance" "$path" "$file"
        else
            echo "Please specify installation folder"
            exit 1 
        fi
fi

if [ $? -eq 0 ]
    then 
        echo "Successfully built instance. Run wsl -d "$instance" "

fi 