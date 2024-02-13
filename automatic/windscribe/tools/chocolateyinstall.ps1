
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://deploy.totallyacdn.com/desktop-apps/2.9.7/Windscribe_2.9.7_beta.exe'

Confirm-Win10

$packageArgs = @{
  packageName     = $env:ChocolateyPackageName
  unzipLocation   = $toolsDir
  fileType        = 'EXE'
  url64           = $url

  softwareName    = 'windscribe*'

  checksum64      = '9b164865a6efdf668c60497e5532991b45765d0db5e1cf3eb17987d8bb8f83b8'
  checksumType64  = 'sha256'

  silentArgs      = '-silent'
  validExitCodes  = @(0)
}

Install-ChocolateyPackage @packageArgs
