Param(
   [string]$token,
   [string]$BuildDirectory
)

invoke-Command {
#$Env:SRCCLR_SCM_REF=$env:BUILD_SOURCEBRANCHNAME
$Env:SRCCLR_SCM_REF="master"
$Env:SRCCLR_SCM_REF_TYPE="branch"
#$Env:SRCCLR_SCM_REV="$env:BUILD_SOURCEVERSION"
$Env:SRCCLR_SCM_REV="1.0.0"
#Write-Output "SRCCLR_SCM_REF: $Env:SRCCLR_SCM_REF"
#Write-Output "SRCCLR_SCM_REF_TYPE: $Env:SRCCLR_SCM_REF_TYPE"
#Write-Output "SRCCLR_SCM_REV: $Env:SRCCLR_SCM_REV"
Write-Output 'Set the SC API Token'
$Env:SRCCLR_API_TOKEN="$token"
Write-Output 'Set the Execution Policy'
Set-ExecutionPolicy Unrestricted -Scope Process -Force
Write-Output 'Download the agent'
$ProgressPreference = "silentlyContinue"
iex ((New-Object System.Net.WebClient).DownloadString('https://download.srcclr.com/ci.ps1'))
Write-Output 'Scan the project'
srcclr scan $BuildDirectory\s  
}