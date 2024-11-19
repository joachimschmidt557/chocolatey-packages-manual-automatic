Import-Module au

$releases = 'https://api.github.com/repos/Windscribe/Desktop-App/releases'

function global:au_BeforeUpdate {
  $Latest.Checksum64 = Get-RemoteChecksum -Url $Latest.Url64 -Algorithm sha256
}

function global:au_SearchReplace {
    @{
        'tools\chocolateyinstall.ps1' = @{
            "(^[$]url\s*=\s*)('.*')" = "`$1'$($Latest.Url64)'"
            "(^\s*?checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
        "$($Latest.PackageName).nuspec" = @{
          '(\<copyright\>).*?(\<\/copyright\>)' = "`${1}$(Get-Date -Format yyyy) Windscribe Limited`$2"
        }
    }
}

function global:au_GetLatest {
    $token = ConvertTo-SecureString $Env:github_api_key -AsPlainText -Force
    $response = Invoke-WebRequest -Uri $releases -UseBasicParsing -Authentication Bearer -Token $token
    $json = ConvertFrom-Json $response

    # Release: Windscribe_2.11.11.exe
    $re_release     = "^Windscribe_[^A-Za-z]+.exe$"
    $release_data   = $null

    # Beta: Windscribe_2.12.4_beta.exe
    $re_beta     = "^Windscribe_[^A-Za-z]+_beta.exe$"
    $beta_data   = $null

    # Alpha: Windscribe_2.12.1_guinea_pig.exe
    $re_alpha     = "^Windscribe_[^A-Za-z]+_guinea_pig.exe$"
    $alpha_data   = $null

    foreach ($release in $json) {
        $asset64 = $release.assets | ? name -match $re_release

        if ($asset64 -eq $null) { continue }

        $url64 = $asset64.browser_download_url

        $version = $release.tag_name -Replace 'v',''

        $release_data = @{ URL64 = $url64; Version = $version }

        break
    }

    foreach ($release in $json) {
        $asset64 = $release.assets | ? name -match $re_beta

        if ($asset64 -eq $null) { continue }

        $url64 = $asset64.browser_download_url

        $version = $release.tag_name -Replace 'v',''
        $version = ($version.split(".") | select -first 3) -join '.'

        $beta_data = @{ URL64 = $url64; Version = "$version-beta" }

        break
    }

    foreach ($release in $json) {
        $asset64 = $release.assets | ? name -match $re_alpha

        if ($asset64 -eq $null) { continue }

        $url64 = $asset64.browser_download_url

        $version = $release.tag_name -Replace 'v',''
        $version = ($version.split(".") | select -first 3) -join '.'

        $alpha_data = @{ URL64 = $url64; Version = "$version-alpha" }

        break
    }

    if ($release_data -eq $null) {
        throw "No release with suitable binaries found."
    }

    if ($beta_data -eq $null) {
        throw "No beta release with suitable binaries found."
    }

    if ($alpha_data -eq $null) {
        throw "No alpha release with suitable binaries found."
    }

    $streams = [ordered] @{
        Alpha = $alpha_data
        Beta = $beta_data
        Stable = $release_data
    }

    return @{ Streams = $streams }
}

Update-Package -ChecksumFor None -NoReadme
