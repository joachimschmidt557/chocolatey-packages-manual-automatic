import-module au

$releases = 'https://github.com/MrS0m30n3/youtube-dl-gui/releases'

function global:au_BeforeUpdate() {
    #Download $Latest.URL32 / $Latest.URL64 in tools directory and remove any older installers.
    Get-RemoteFiles -Purge
}

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            #"(^[$]url\s*=\s*)('.*')"      = "`$1'$($Latest.URL)'"
            "(^[$]checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }

        ".\legal\VERIFICATION.txt" = @{
            "(?i)(\s+URL:).*"             = "`${1} $($Latest.URL32)"
            "(?i)(checksum:).*"           = "`${1} $($Latest.Checksum32)"
          }
    }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases

    # youtube-dl-gui-0.4-win-portable.zip
    $re  = "youtube-dl-gui-.+-win-portable.zip"
    $url = $download_page.links | ? href -match $re | select -First 1 -expand href

    $version = ($url -split '-' | select -last 1 -Skip 2)

    $Latest = @{ URL = ("https://github.com" + $url); Version = $version }
    return $Latest
}

update -ChecksumFor 32
