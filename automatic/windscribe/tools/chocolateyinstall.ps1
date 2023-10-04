
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://deploy.totallyacdn.com/desktop-apps/2.7.12/Windscribe_2.7.12_beta.exe'

Confirm-Win10

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url64         = $url

  softwareName  = 'windscribe*'

  checksum      = 'ee5329a5a9d3f2d1c048f6c0808ff8481477ffdd8fc8b300d4b256f9b0b0a696'
  checksumType  = 'sha256'

  silentArgs   = '-silent'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
