
REM checks for scoop package manager
IF EXIST "C:\Users\%USERNAME%\scoop\" (
    scoop bucket add extras
    scoop install archwsl
    IF %errorlevel% ==  0 (
        echo "Arch Linux installation successful"
    ) ELSE (
        echo "An error occured when installing Arch Linux"
    )      
) 
ELSE (
   cd "C:\"

   REM scoop installation
   Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
   Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression

    scoop bucket add extras
    scoop install archwsl

    IF %errorlevel% ==  0 (
        echo "Arch Linux installation successful"
    ) ELSE (
        echo "An error occured when installing Arch Linux"
    )       
)



