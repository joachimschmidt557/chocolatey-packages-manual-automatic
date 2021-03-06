import-module au

$releases = 'https://github.com/ninja-build/ninja/releases'

function global:au_BeforeUpdate() {
    #Download $Latest.URL32 / $Latest.URL64 in tools directory and remove any older installers.
    Get-RemoteFiles -Purge
    $Latest.Checksum32 = Get-RemoteChecksum $Latest.URL32
    #$Latest.Checksum64 = Get-RemoteChecksum $Latest.URL64
}

function global:au_SearchReplace {
    @{
        ".\legal\VERIFICATION.txt" = @{
            "(?i)(\s+URL:).*"             = "`${1} $($Latest.URL32)"
            #"(?i)(\s+64-bit:).*"             = "`${1} $($Latest.URL64)"
            "(?i)(checksum:).*"           = "`${1} $($Latest.Checksum32)"
            #"(?i)(checksum64:).*"           = "`${1} $($Latest.Checksum64)"
          }
     }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

    # fd-v6.2.0-i686-pc-windows-gnu.zip
    $re_32  = "ninja-win.zip"
    #$re_64  = "fd-v.+-x86_64-pc-windows-gnu.zip"
    $url32 = $download_page.links | ? href -match $re_32 | select -First 1 -expand href
    #$url64 = $download_page.links | ? href -match $re_64 | select -First 1 -expand href

    $url32 = "https://github.com" + $url32
    #$url64 = "https://github.com" + $url64

    $version = ($url32 -split '/' | select -last 1 -skip 1) -Replace 'v',''

    $Latest = @{ URL32 = $url32; Version = $version }
    return $Latest
}

update -ChecksumFor none
