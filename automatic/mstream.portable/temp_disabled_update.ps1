import-module au

$releases = 'https://github.com/IrosTheBeggar/mStream/releases'

function global:au_BeforeUpdate() {
    $Latest.Checksum32 = Get-RemoteChecksum $Latest.URL32
}

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^[$]url\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^[$]checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
     }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

    #mstreamExpress-Windows-x64-portable.zip
    $re  = "mStreamExpress.*-Windows-x64-portable.zip"
    $url = $download_page.links | ? href -match $re | select -First 1 -expand href

    $version = ($url -split '/' | select -last 1 -skip 1) -Replace 'v',''

    $Latest = @{ URL32 = ("https://github.com" + $url); Version = $version }
    return $Latest
}

update -ChecksumFor none
