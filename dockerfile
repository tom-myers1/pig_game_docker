FROM mcr.microsoft.com/windows/servercore/iis
SHELL ["powershell"]

# initial setup 
RUN Install-WindowsFeature NET-Framework-45-ASPNET ; \
    Install-WindowsFeature Web-Asp-Net45 ; \
    New-Item -ItemType Directory -Path 'c:\pigs' ; \
    if (!(get-module webadministration)) {Import-Module webadministration}


# copy site
COPY www/ 'c:\pigs'

# create set and set iis config 
RUN Remove-WebSite -Name 'Default Web Site'
RUN New-Website -Name 'pigs' -Port 80 -PhysicalPath 'c:\pigs' -ApplicationPool '.NET v4.5'
RUN New-WebBinding -Name 'pigs' -Protocol 'http' -Port 80 -IPAddress '*' -HostHeader 'www.piggame.doc.zolv.com'
EXPOSE 443
