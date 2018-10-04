import-module au

$releases = 'https://github.com/jean-emmanuel/open-stage-control/releases'

function global:au_BeforeUpdate() {
    #Download $Latest.URL32 / $Latest.URL64 in tools directory and remove any older installers.
    Get-RemoteFiles -Purge
    $Latest.Checksum32 = Get-RemoteChecksum $Latest.URL32
    $Latest.Checksum64 = Get-RemoteChecksum $Latest.URL64
}

function global:au_SearchReplace {
    @{
        ".\legal\VERIFICATION.txt" = @{
            "(?i)(\s+32-bit:).*"             = "`${1} $($Latest.URL32)"
            "(?i)(\s+64-bit:).*"             = "`${1} $($Latest.URL64)"
            "(?i)(checksum32:).*"           = "`${1} $($Latest.Checksum32)"
            "(?i)(checksum64:).*"           = "`${1} $($Latest.Checksum64)"
          }
     }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

    # open-stage-control-0.37.3-win32-x64.zip
    $re_32  = "open-stage-control-.+-win32-ia32.zip"
    $re_64  = "open-stage-control-.+-win32-x64.zip"
    $url32 = $download_page.links | ? href -match $re_32 | select -First 1 -expand href
    $url64 = $download_page.links | ? href -match $re_64 | select -First 1 -expand href

    $url32 = "https://github.com" + $url32
    $url64 = "https://github.com" + $url64

    $version = ($url32 -split '-' | select -last 1 -skip 4)

    $Latest = @{ URL32 = $url32; URL64 = $url64; Version = $version }
    return $Latest
}

update -ChecksumFor none
