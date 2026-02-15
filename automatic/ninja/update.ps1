import-module au

$releases = 'https://api.github.com/repos/ninja-build/ninja/releases'

function global:au_BeforeUpdate() {
    #Download $Latest.URL32 / $Latest.URL64 in tools directory and remove any older installers.
    Get-RemoteFiles -Purge
}

function global:au_SearchReplace {
    @{
        ".\legal\VERIFICATION.txt" = @{
            "(?i)(\s+URL:).*"             = "`${1} $($Latest.URL32)"
            #"(?i)(\s+64-bit:).*"             = "`${1} $($Latest.URL64)"
            "(?i)(checksum:).*"           = "`${1} $($Latest.Checksum32)"
            #"(?i)(checksum64:).*"           = "`${1} $($Latest.Checksum64)"
        }

        'tools\chocolateyInstall.ps1' = @{
            "(^[$]fileName\s*=\s*)('.*')"      = "`$1'$($Latest.FileName64)'"
        }
    }
}

function global:au_GetLatest {
    $token = ConvertTo-SecureString $Env:github_api_key -AsPlainText -Force
    $response = Invoke-WebRequest -Uri $releases -UseBasicParsing -Authentication Bearer -Token $token
    $json = ConvertFrom-Json $response

    $re_32  = "ninja-win.zip"
    #$re_64  = "fd-v.+-x86_64-pc-windows-gnu.zip"

    foreach ($release in $json) {
        $asset32 = $release.assets | ? name -match $re_32
        # $asset64 = $release.assets | ? name -match $re_64

        if ($asset32 -eq $null) { continue }
        # if ($asset64 -eq $null) { continue }

        $url32 = $asset32.browser_download_url
        # $url64 = $asset64.browser_download_url

        $version = $release.tag_name -Replace 'v',''

        $Latest = @{ URL32 = $url32; Version = $version }
        return $Latest
    }

    throw "No release with suitable binaries found."
}

update -ChecksumFor none
