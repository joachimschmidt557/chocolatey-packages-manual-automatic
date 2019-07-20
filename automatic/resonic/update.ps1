import-module au

$download = 'https://resonic.at/get/player'

function global:au_SearchReplace {

    @{
        "$($Latest.PackageName).nuspec" = @{
          "(\<dependency .+?`"$($Latest.PackageName).install`" version=)`"([^`"]+)`"" = "`$1`"[$($Latest.Version)]`""
        }
    }

}

function global:au_GetLatest {
    $download_file = Invoke-WebRequest -Uri $download -Method Head

    $version = ($download_file.Headers["Content-Disposition"] -split ' ' | select -last 1 ).replace('.msi"', '')

    $Latest = @{ URL = $download; Version = $version }
    return $Latest
}

update -ChecksumFor 32 -NoCheckUrl
