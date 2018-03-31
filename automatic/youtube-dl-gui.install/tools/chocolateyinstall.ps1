
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$checksum   = 'B0FC0A0ED763639873438B859A9172B4B0059D81360AD481AA4577DD597F790D'

$installPackageArgs = @{
  packageName = $env:ChocolateyPackageName
  fileType = 'EXE'
  File = Get-Item "$toolsDir\youtube-dlg-*.exe"

  softwareName = 'Youtube-DLG*'

  checksum      = $checksum
  checksumType  = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @installPackageArgs

Get-ChildItem $toolsDir\*.exe | ForEach-Object { Remove-Item $_ -ea 0; if (Test-Path $_) { Set-Content -Value "" -Path "$_.ignore" }}
