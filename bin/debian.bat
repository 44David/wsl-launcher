echo "Installing Debian"
wsl --install -d Debian

IF %errorlevel% == 0 (
    echo "Debian installed successfully. Type 'debian' in your terminal to get started"
)