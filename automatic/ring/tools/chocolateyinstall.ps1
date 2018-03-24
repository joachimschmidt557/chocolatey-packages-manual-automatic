
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'https://dl.ring.cx/windows/ring-windows-nightly-20180323191659~gitcbff567.exe'
$url64      = 'https://dl.ring.cx/windows/ring-windows-nightly_x86_64-20180323191659~gitcbff567.exe'
$checksum32 = '15f8be647b1ee6343ff8c859d8ceb7c96e8fcf5f4c2c18ab638b082b050be622'
$checksum64 = 'c79c46ce0269f73ffd06e6dbec1ac7c46b4eac0c834ece71d420163ec2fcfab4'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url32
  url64Bit      = $url64

  softwareName  = 'ring*'

  checksum      = $checksum32
  checksumType  = 'sha256'
  checksum64    = $checksum64
  checksumType64= 'sha256'

  silentArgs   = '/S'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
