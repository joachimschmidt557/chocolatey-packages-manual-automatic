import-module au

$releases = 'https://github.com/mltframework/shotcut/releases'

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^[$]url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
            "(^[$]checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
     }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

    # https://github.com/mltframework/shotcut/releases/download/v18.03/shotcut-win64-180306.exe
    $re_64  = "shotcut-win64-.+.exe"
    $url64 = $download_page.links | ? href -match $re_64 | select -First 1 -expand href

    $url64 = "https://github.com" + $url64

    $version = ($url64 -split '/' | select -last 1 -skip 1) -Replace 'v',''

    $Latest = @{ URL64 = $url64; Version = $version }
    return $Latest
}

update -ChecksumFor 64
