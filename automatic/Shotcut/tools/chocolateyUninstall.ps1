try {
  $processor = Get-WmiObject Win32_Processor
  $is64bit = $processor.AddressWidth -eq 64
  if ($is64bit) {
    $unpath = "${Env:ProgramFiles(x86)}\Shotcut\uninstall.exe"
  } else {
    $unpath = "${Env:ProgramFiles}\Shotcut\uninstall.exe"
  }
  Uninstall-ChocolateyPackage 'Shotcut' 'EXE' '/S' "$unpath" -validExitCodes @(0)

  Write-ChocolateySuccess 'Shotcut'
} catch {
  Write-ChocolateyFailure 'Shotcut' "$($_.Exception.Message)"
  throw
}