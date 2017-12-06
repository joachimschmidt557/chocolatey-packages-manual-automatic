import-module au

$releases = 'https://github.com/upx/upx/releases'

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^[$]url\s*=\s*)('.*')"      = "`$1'$($Latest.URL)'"
            "(^[$]checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
     }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases

    #upx394w.zip
    $re  = "upx.+w.zip"
    $url = $download_page.links | ? href -match $re | select -First 1 -expand href

    #$version = $url -split '-' | select -First 1 -Skip 1

    $Latest = @{ URL = $url; Version = $version }
    return $Latest
}

update -ChecksumFor 32
