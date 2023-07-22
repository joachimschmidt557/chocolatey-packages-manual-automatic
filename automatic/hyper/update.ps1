import-module au

$releases = 'https://api.github.com/repos/vercel/hyper/releases'

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
    $token = ConvertTo-SecureString $Env:github_api_key -AsPlainText -Force
    $response = Invoke-WebRequest -Uri $releases -UseBasicParsing -Authentication Bearer -Token $token
    $json = ConvertFrom-Json $response

    # Release: Hyper-Setup-2.0.0.exe
    $re_release     = "^Hyper-Setup-[^A-Za-z]+.exe$"
    $release_data   = $null

    # Canary: Hyper-Setup-2.1.0-canary.2.exe
    $re_canary      = "^Hyper-Setup-[^A-Za-z]+-canary.[^A-Za-z]+.exe$"
    $canary_data   = $null

    foreach ($release in $json) {
        $asset64 = $release.assets | ? name -match $re_release

        if ($asset64 -eq $null) { continue }

        $url64 = $asset64.browser_download_url

        $version = $release.tag_name -Replace 'v',''

        $release_data = @{ URL64 = $url64; Version = $version }

        break
    }

    foreach ($release in $json) {
        $asset64 = $release.assets | ? name -match $re_canary

        if ($asset64 -eq $null) { continue }

        $url64 = $asset64.browser_download_url

        $version = $release.tag_name -Replace 'v',''
        $version = ($version.split(".") | select -first 3) -join '.'

        $canary_data = @{ URL64 = $url64; Version = $version }

        break
    }

    if ($release_data -eq $null) {
        throw "No release with suitable binaries found."
    }

    if ($canary_data -eq $null) {
        throw "No canary release with suitable binaries found."
    }

    @{
        Streams = [ordered] @{
            'release' = $release_data
            'canary' = $canary_data
        }
    }
}

update -ChecksumFor none
