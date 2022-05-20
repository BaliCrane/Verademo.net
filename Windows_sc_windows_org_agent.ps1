Param(
   [string]$token,
   [string]$BuildDirectory,
   [string]$slug
)

invoke-Command {
Write-Output 'Set the SC API Token'
$Env:SRCCLR_API_TOKEN="$token"
Write-Output 'Set the Execution Policy'
Set-ExecutionPolicy Unrestricted -Scope Process -Force
Write-Output 'Download the agent'
iex ((New-Object System.Net.WebClient).DownloadString('https://download.srcclr.com/ci.ps1'))
Write-Output 'Scan the project'
srcclr scan --ws=$slug $BuildDirectory\s
}