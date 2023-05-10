
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

# Make a nicer shim
$longFileName = Get-Item "$toolsDir\Buttercup*-portable.exe" | Select-Object -last 1
Install-BinFile -Name "buttercup" -Path "$longFileName"
