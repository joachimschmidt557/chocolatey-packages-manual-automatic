Install-ChocolateyZipPackage -PackageName 'unfreez' `
-Url 'http://www.whitsoftdev.com/files/unfreez.zip' `
-UnzipLocation "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)" `
-Checksum "6B61293748A8500BF7DC073612715EE8D22DAE38B0DA25B7264A3007CACC209F" `
-ChecksumType "sha256"