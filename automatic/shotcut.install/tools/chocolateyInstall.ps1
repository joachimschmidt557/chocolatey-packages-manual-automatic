
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64      = 'https://github.com/mltframework/shotcut/releases/download/v25.03.13/shotcut-win64-250313.exe'
$checksum64 = '9b0f838fae23d1d413cc9a2b3e5a0f992cf6b70f312e7bd9cc704ed128ad7713'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url64Bit      = $url64

  softwareName  = 'shotcut*'

  checksum64    = $checksum64
  checksumType64= 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /ALLUSERS'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
