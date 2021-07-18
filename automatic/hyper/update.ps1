import-module au

$releases = 'https://github.com/zeit/hyper/releases'

function global:au_BeforeUpdate() {
    #Download $Latest.URL32 / $Latest.URL64 in tools directory and remove any older installers.
    Get-RemoteFiles -Purge
    $Latest.Checksum64 = Get-RemoteChecksum $Latest.URL64
}

function global:au_SearchReplace {
    @{
        ".\legal\VERIFICATION.txt" = @{
            "(?i)(\s+URL:).*"             = "`${1} $($Latest.URL64)"
            "(?i)(checksum:).*"           = "`${1} $($Latest.Checksum64)"
          }
     }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

    # Release: Hyper-Setup-2.0.0.exe
    $re_release     = "Hyper-Setup-[^A-Za-z]+.exe"
    $url_release    = $download_page.links | ? href -match $re_release | select -First 1 -expand href
    $url_release    = "https://github.com" + $url_release

    $version_release= ($url_release -split '/' | select -last 1 -skip 1) -Replace 'v',''

    # Canary: Hyper-Setup-2.1.0-canary.2.exe
    $re_canary      = "Hyper-Setup-[^A-Za-z]+-canary.[^A-Za-z]+.exe"
    $url_canary     = $download_page.links | ? href -match $re_canary | select -First 1 -expand href
    $url_canary     = "https://github.com" + $url_canary

    $version_canary = ($url_canary -split '/' | select -last 1 -skip 1) -Replace 'v',''
    $version_canary = ($version_canary.split(".") | select -first 3) -join '.'

    #$Latest = @{ URL = $url; Version = $version }
    #return $Latest

    @{
        Streams = [ordered] @{
            'release' = @{ Version = $version_release; URL64 = $url_release }
            'canary' = @{ Version = $version_canary; URL64 = $url_canary }
        }
    }
}

update -ChecksumFor none
