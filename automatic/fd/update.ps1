import-module au

$releases = 'https://github.com/sharkdp/fd/releases'

function global:au_BeforeUpdate() {
    #Download $Latest.URL32 / $Latest.URL64 in tools directory and remove any older installers.
    Get-RemoteFiles -Purge
}

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            #"(^[$]url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
            #"(^[$]url32\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^[$]checksum32\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
            "(^[$]checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }

        ".\legal\VERIFICATION.txt" = @{
            "(?i)(\s+32-bit:).*"             = "`${1} $($Latest.URL32)"
            "(?i)(\s+64-bit:).*"             = "`${1} $($Latest.URL64)"
            "(?i)(checksum32:).*"           = "`${1} $($Latest.Checksum32)"
            "(?i)(checksum64:).*"           = "`${1} $($Latest.Checksum64)"
          }
     }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases

    # fd-v6.2.0-i686-pc-windows-gnu.zip
    $re_32  = "fd-v.+-i686-pc-windows-gnu.zip"
    $re_64  = "fd-v.+-x86_64-pc-windows-gnu.zip"
    $url32 = $download_page.links | ? href -match $re_32 | select -First 1 -expand href
    $url64 = $download_page.links | ? href -match $re_64 | select -First 1 -expand href

    $url32 = "https://github.com" + $url32
    $url64 = "https://github.com" + $url64

    $version = ($url32 -split '-' | select -last 1 -skip 4) -Replace 'v',''

    $Latest = @{ URL32 = $url32; URL64 = $url64; Version = $version }
    return $Latest
}

update
