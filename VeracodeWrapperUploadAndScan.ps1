Param(
   [string]$appname,
   [string]$scanname,
   [string]$id,
   [string]$key,
   [string]$filepath,
   [string]$VERACODE_WRAPPER_VERSION
)

invoke-Command {
Set-ExecutionPolicy Unrestricted -Scope Process -Force
Write-Output "path is https://repo1.maven.org/maven2/com/veracode/vosp/api/wrappers/vosp-api-wrappers-java/$VERACODE_WRAPPER_VERSION/vosp-api-wrappers-java-$VERACODE_WRAPPER_VERSION.jar"
Write-Output "java version"
java -version
Write-Output 'Download Wrapper'
$WebClient = New-Object System.Net.WebClient
$WebClient.DownloadFile("https://repo1.maven.org/maven2/com/veracode/vosp/api/wrappers/vosp-api-wrappers-java/$VERACODE_WRAPPER_VERSION/vosp-api-wrappers-java-$VERACODE_WRAPPER_VERSION.jar","veracode-wrapper.jar")
Write-Output 'Veracode Upload and Scan'
java -jar veracode-wrapper.jar -vid $id -vkey $key -action UploadAndScan -appname $appname -createprofile true -autoscan true -scantimeout 180 -filepath $filepath -version $scanname
}