echo "Loading personal and system Powershell profile..."

$greenCheck = @{
  Object = "`n " + [Char]8730 + " "
  ForegroundColor = 'Black'
  BackgroundColor = 'Green'
  NoNewLine = $true
}
  
Start-Service ssh-agent
Write-Host @greenCheck
Write-Host " SSH-Agent enabled" -ForegroundColor Green

Import-Module PSReadLine
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -PredictionSource History
Write-Host @greenCheck
Write-Host " PS command-line prediction has been enabled" -ForegroundColor Green

function graph() { git log --oneline --graph --decorate --all }

#BNR alias stuff
function bnr() { d: ; cd d:\bnr }
function ott() { d: ; cd d:\bnr\ott }

# Java JDK stuff
function javabin { $env:Path = $env:JAVA_HOME + '\bin;' + $env:Path }
function java8 { [Environment]::SetEnvironmentVariable("JAVA_HOME", "C:\Users\$env:UserName\.jdks\temurin-1.8.0_362"); javabin; echo ""; java -version }
function java11 { [Environment]::SetEnvironmentVariable("JAVA_HOME", "C:\Users\$env:UserName\.jdks\temurin-11.0.18"); javabin; echo ""; java --version }
java11

echo "Switch java version, type:"
echo "  java8 (for java 1.8.0_362)"
echo "  java11 (for java 11.0.18)"

Write-Host @greenCheck
Write-Host " Java SDK enabled" -ForegroundColor Green

# Boiler plate powerlines for powershell
#oh-my-posh --init --shell pwsh --config ~/jandedobbeleer.omp.json | Invoke-Expression
# Hanselmann powerlines for powershell
oh-my-posh --init --shell pwsh --config ~/ohmyposhv3-v2.json | Invoke-Expression

Write-Host @greenCheck
Write-Host " Oh-My-Posh and powerlines enabled" -ForegroundColor Green

Import-Module -Name Terminal-Icons

Write-Host @greenCheck
Write-Host " Terminal-Icons enabled" -ForegroundColor Green

$env:UserName
[Environment]::OSVersion
