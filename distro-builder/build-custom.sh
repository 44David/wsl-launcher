BLUE="\e[94m"
ENDCOLOR="\e[0m"

git clone https://github.com/44David/WSL-DistroLauncher

if [ -d "$C:\Program Files (x86)\Microsoft Visual Studio\Installer" ]
    then 

        $cert = New-SelfSignedCertificate -DnsName @("contoso.com", "www.contoso.com") -CertStoreLocation "cert:\LocalMachine\My"

        $certKeyPath = "c:\certs\contoso.com.pfx"
        $password = ConvertTo-SecureString 'password' -AsPlainText -Force
        $cert | Export-PfxCertificate -FilePath $certKeyPath -Password $password
        $rootCert = $(Import-PfxCertificate -FilePath $certKeyPath -CertStoreLocation 'Cert:\LocalMachine\Root' -Password $password)
elif [ ! -d "$C:\Program Files (x86)\Microsoft Visual Studio\Installer" ]
    then 
        echo "Build Failed."
        echo "You dont have visual studio installed."
        echo -e "Install here ->   ${BLUE}https://visualstudio.microsoft.com/downloads/${ENDCOLOR}"
fi

wsl -d Debian 

