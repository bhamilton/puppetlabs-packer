$ErrorActionPreference = "Stop"

. C:\Packer\Scripts\windows-env.ps1

Write-Output "Running Win-10 Package Customisation"

# Flag to remove Apps packages and other nuisances
Touch-File "$PackerLogs\AppsPackageRemove.Required"
