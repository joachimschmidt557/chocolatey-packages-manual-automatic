
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64      = 'https://github.com/mltframework/shotcut/releases/download/v21.01.16/shotcut-win64-210116.exe'
$checksum64 = 'e2fdd2edf0a4071096e57745c2f2c59d6a846a13e83bce9bdf038adfefa6eeec'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url64Bit      = $url64

  softwareName  = 'shotcut*'

  checksum64    = $checksum64
  checksumType64= 'sha256'

  silentArgs   = '/S'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
