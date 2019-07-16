
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'https://github.com/mltframework/shotcut/releases/download/v19.07.15/shotcut-win32-190715.exe'
$url64      = 'https://github.com/mltframework/shotcut/releases/download/v19.07.15/shotcut-win64-190715.exe'
$checksum32 = '787aa814425517b3af128718db3a1f8069e1b5be15c1e42e55744a7d2f3f96e9'
$checksum64 = '5940887593e5a0785941b82e5197c8997bb9ca71de059271db732629206cfcc2'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url32
  url64Bit      = $url64

  softwareName  = 'shotcut*'

  checksum      = $checksum32
  checksumType  = 'sha256'
  checksum64    = $checksum64
  checksumType64= 'sha256'

  silentArgs   = '/S'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
