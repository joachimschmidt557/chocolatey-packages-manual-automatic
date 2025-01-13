$url = "https://www.dcmembers.com/skrommel/download/draglock/?wpdmdl=284"

Install-ChocolateyZipPackage -PackageName 'DragLock' `
  -Url $url `
  -UnzipLocation "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)" `
  -Checksum "80d82bdb7717eab8ed2035d00ee581c019b65d554e2024748086e2f9a598ded0" `
  -ChecksumType "sha256"
