import-module au

$releases = 'https://github.com/ricochet-im/ricochet/releases'

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^[$]url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
            "(^[$]url32\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^[$]checksum32\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
            "(^[$]checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
     }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases

    #tidy-5.1.25-win64.zip
    $re  = "ricochet-.+-win-install.exe"
    $url = $download_page.links | ? href -match $re | select -First 1 -expand href

    $version = $url -split '-' | select -First 1 -Skip 1

    $Latest = @{ URL = $url; Version = $version }
    return $Latest
}

update
