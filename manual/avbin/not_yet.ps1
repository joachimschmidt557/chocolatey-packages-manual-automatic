import-module au

$releases = 'https://github.com/IrosTheBeggar/mStream/releases'

function global:au_BeforeUpdate() {
    $Latest.Checksum32 = Get-RemoteChecksum $Latest.URL32
}

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^[$]url\s*=\s*)('.*')"      = "`$1'$($Latest.URL)'"
            "(^[$]checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
     }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases

    #mstreamExpress-portable-v0.6.zip
    $re  = "mStreamExpress-installer-v.+.exe"
    $url = $download_page.links | ? href -match $re | select -First 1 -expand href

    $version = ($url -split '-' | select -last 1).replace("v",'').replace(".exe","")

    $Latest = @{ URL32 = ("https://github.com" + $url); Version = $version }
    return $Latest
}

update -ChecksumFor none
