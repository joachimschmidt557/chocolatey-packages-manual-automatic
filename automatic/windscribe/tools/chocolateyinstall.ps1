
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://deploy.totallyacdn.com/desktop-apps/2.5.14/Windscribe_2.5.14.exe'

Confirm-Win10

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url64         = $url

  softwareName  = 'windscribe*'

  checksum      = 'eb297ec3a93064091a682a2f35a80b41ba6a015b986eb1ce3bf638b491e4c0f2'
  checksumType  = 'sha256'

  silentArgs   = '-silent'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
