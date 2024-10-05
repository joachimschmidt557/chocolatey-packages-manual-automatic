$url = "https://www.dcmembers.com/skrommel/download/bigbyte/?wpdmdl=216"

Install-ChocolateyZipPackage -PackageName 'BigByte' `
  -Url $url `
  -UnzipLocation "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)" `
  -Checksum "4ab78826459bcb9dfe66925d1cba7729db77562ee320bf6f7e8331ae574b5831" `
  -ChecksumType "sha256"
