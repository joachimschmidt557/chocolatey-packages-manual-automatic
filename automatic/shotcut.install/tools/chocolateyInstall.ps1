
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'https://github.com/mltframework/shotcut/releases/download/v19.12.31/shotcut-win32-191231.exe'
$url64      = 'https://github.com/mltframework/shotcut/releases/download/v19.12.31/shotcut-win64-191231.exe'
$checksum32 = 'ed65c85f9644917ca5a4a59ed6110e6238f98a3b67c321f3e86705a89ee805c7'
$checksum64 = '4599798f6bc0f34b6424a76571120a5017e7379a8c52931d48c7f39aecf5afab'

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
