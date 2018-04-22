
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'https://dl.ring.cx/windows/ring-windows-nightly-20180420235848~gitac1aac4.exe'
$url64      = 'https://dl.ring.cx/windows/ring-windows-nightly_x86_64-20180420235848~gitac1aac4.exe'
$checksum32 = '3bcba1c23a135165e57c17599c9d68cb6ef9b5ad15cb21c00161f8f9028f03a3'
$checksum64 = '8602acc31f4ecff97e0c6fe858efa811fb09f5f3f63fca2fccd9e082f07c0fd6'

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
