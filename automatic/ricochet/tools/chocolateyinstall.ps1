
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://ricochet.im/releases/1.1.4/ricochet-1.1.4-win-install.exe'
$checksum   = '9096F058B8471CA7B1204D1ACB34114E497B07902EB7811FC414D52B45B7DB59'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url

  softwareName  = 'ricochet*'

  checksum      = $checksum
  checksumType  = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs

$ProcessActive = Get-Process ricochet -ErrorAction SilentlyContinue
if($ProcessActive -ne $null)
{
    Stop-Process -Name "ricochet"
}
