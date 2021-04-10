﻿
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://assets.windscribe.com/desktop/win/Windscribe.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url

  softwareName  = 'windscribe*'

  checksum      = '99CDB9444846013D521AB46E3C264F0EB845CE295D6655EC4C5A7EE44004E3F0'
  checksumType  = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /NODRIVER'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
