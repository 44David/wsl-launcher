instance=$1 
file=$2

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




mkdir -p "$instance"-vhdx-storage

echo "Building... (This may take several minutes)"

wsl --import "$instance" "$path" "$file"


    
if [ $? -eq 0 ]
    then 
        echo "Successfully built instance. Run wsl -d "$instance" to launch."
fi 