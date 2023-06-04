
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

# Remove the shim
Uninstall-BinFile -Name "buttercup"
