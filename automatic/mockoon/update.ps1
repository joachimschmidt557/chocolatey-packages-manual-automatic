import-module au

$releases = 'https://github.com/255kb/mockoon/releases'

function global:au_BeforeUpdate() {
    #Download $Latest.URL32 / $Latest.URL64 in tools directory and remove any older installers.
    $Latest.Checksum32 = Get-RemoteChecksum $Latest.URL32
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

    # Release: mockoon.setup.1.1.0.exe
    $re_release     = "mockoon.setup.[^A-Za-z]+.exe"
    $url_release    = $download_page.links | ? href -match $re_release | select -First 1 -expand href
    $url_release    = "https://github.com" + $url_release

    $version_release= ($url_release -split '/' | select -last 1 -skip 1) -Replace 'v',''

    ## Canary: hyper-Setup-2.1.0-canary.2.exe
    #$re_canary      = "hyper-Setup-[^A-Za-z]+-canary.[^A-Za-z]+.exe"
    #$url_canary     = $download_page.links | ? href -match $re_canary | select -First 1 -expand href
    #$url_canary     = "https://github.com" + $url_canary

    #$version_canary = ($url -split '/' | select -last 1 -skip 1)

    $Latest = @{ URL32 = $url_release; Version = $version_release }
    return $Latest

    #@{
    #    Streams = [ordered] @{
    #        'release' = @{ Version = $version_release; URL32 = $url_release }
    #        'canary' = @{ Version = $version_canary; URL32 = $url_canary }
    #    }
    #}
}

update -ChecksumFor none
