﻿
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64      = 'https://github.com/mltframework/shotcut/releases/download/v25.07.16/shotcut-win64-250716.exe'
$checksum64 = 'bcdabccd8a57fb760b82a82fa5f3f2eb5c1c80eb0e76f2909a697bf432795423'

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
