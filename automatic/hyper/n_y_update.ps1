import-module au

$releases = 'https://github.com/upx/upx/releases'

function global:au_BeforeUpdate() {
    #Download $Latest.URL32 / $Latest.URL64 in tools directory and remove any older installers.
    Get-RemoteFiles -Purge
}

function global:au_SearchReplace {
    @{
        ".\legal\VERIFICATION.txt" = @{
            "(?i)(\s+URL:).*"             = "`${1} $($Latest.URL32)"
            "(?i)(checksum:).*"           = "`${1} $($Latest.Checksum32)"
          }
     }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

    #upx394w.zip
    $re  = "upx.+w.zip"
    $url = $download_page.links | ? href -match $re | select -First 1 -expand href
    $url = "https://github.com" + $url

    $version = ($url -split '/' | select -last 1 -skip 1) -Replace 'v',''

    $Latest = @{ URL = $url; Version = $version }
    return $Latest
}

update -ChecksumFor 32
