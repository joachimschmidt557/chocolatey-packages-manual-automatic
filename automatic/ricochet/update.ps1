import-module au

$releases = 'https://github.com/ricochet-im/ricochet/releases'

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^[$]url\s*=\s*)('.*')"      = "`$1'$($Latest.URL)'"
            "(^[$]checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
     }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

    #tidy-5.1.25-win64.zip
    $re  = "/releases/download/.+/ricochet-.+-win-install.exe"
    $url = $download_page.links | ? href -match $re | select -First 1 -expand href

    $version = $url -split '-' | select -Last 1 -Skip 2

    $Latest = @{ URL = $url; Version = $version }
    return $Latest
}

update -ChecksumFor 32
