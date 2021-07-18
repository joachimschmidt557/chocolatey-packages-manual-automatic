import-module au

$releases = 'https://github.com/buttercup/buttercup-desktop/releases'

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

    # Buttercup-win-x64-2.9.1-installer.exe
    $re  = "Buttercup-win-x64-[^A-Za-z]+-installer.exe"
    $url = $download_page.links | ? href -match $re | select -First 1 -expand href

    $url = "https://github.com" + $url

    $version = ($url -split '/' | select -last 1 -skip 1) -Replace 'v',''

    $Latest = @{ URL64 = $url; Version = $version }
    return $Latest
}

update -ChecksumFor 64
