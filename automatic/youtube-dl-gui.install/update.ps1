import-module au

$releases = 'https://github.com/oleksis/youtube-dl-gui/releases'

function global:au_BeforeUpdate() {
    #Download $Latest.URL32 / $Latest.URL64 in tools directory and remove any older installers.
    Get-RemoteFiles -Purge -NoSuffix -FileNameBase 'yt-dlg'
}

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^[$]checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
        ".\legal\VERIFICATION.txt" = @{
            "(?i)(\s+URL:).*"             = "`${1} $($Latest.URL64)"
            "(?i)(checksum:).*"           = "`${1} $($Latest.Checksum64)"
          }
     }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases

    $re  = "yt-dlg.*\.msi"
    $url = $download_page.links | ? href -match $re | select -First 1 -expand href

    $version = ( $url -split '/' | select -last 1 -Skip 1 | % SubString(1) )

    $Latest = @{ URL64 = ("https://github.com" + $url); Version = $version }
    return $Latest
}

update -ChecksumFor none
