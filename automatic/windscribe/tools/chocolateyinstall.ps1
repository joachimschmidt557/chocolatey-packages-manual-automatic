
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://deploy.totallyacdn.com/desktop-apps/2.8.2/Windscribe_2.8.2_guinea_pig.exe'

Confirm-Win10

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url64         = $url

  softwareName  = 'windscribe*'

  checksum      = '3cc1546f6a3de87fded7ffce22db5599f46e916da3ea070ab2eee375e1aea5ac'
  checksumType  = 'sha256'

  silentArgs   = '-silent'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
