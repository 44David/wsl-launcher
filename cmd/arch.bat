
REM checks for scoop package manager
IF EXIST "C:\Users\%USERNAME%\scoop\" (
    scoop bucket add extras
    scoop install archwsl
    IF %errorlevel% ==  0 (
        echo "Arch Linux installation successful"
    )       
) 
ELSE (
   cd "C:\"

   REM scoop installation
   Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
   Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
)



