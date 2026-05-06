# Desinstalle le patch FR : restaure script.mpk.bak et system.mpk.bak.

$ErrorActionPreference = 'Stop'

function Write-Step($n, $total, $msg) {
    Write-Host ""
    Write-Host "[$n/$total] $msg" -ForegroundColor Cyan
}
function Write-Ok($msg) { Write-Host "      $msg" -ForegroundColor Green }
function Write-Fail($msg) { Write-Host "      $msg" -ForegroundColor Red }
function Write-Warn($msg) { Write-Host "      $msg" -ForegroundColor Yellow }

function Read-SteamPath {
    foreach ($key in 'HKLM:\SOFTWARE\WOW6432Node\Valve\Steam', 'HKLM:\SOFTWARE\Valve\Steam', 'HKCU:\SOFTWARE\Valve\Steam') {
        try {
            $val = (Get-ItemProperty -Path $key -ErrorAction Stop).InstallPath
            if ($val -and (Test-Path $val)) { return $val }
        } catch { }
    }
    return $null
}

function Get-SteamLibraries($steamPath) {
    $libs = @($steamPath)
    $vdf = Join-Path $steamPath 'steamapps\libraryfolders.vdf'
    if (-not (Test-Path $vdf)) { return $libs }
    $content = Get-Content $vdf -Raw
    $matches = [regex]::Matches($content, '"path"\s+"([^"]+)"')
    foreach ($m in $matches) {
        $p = $m.Groups[1].Value -replace '\\\\', '\'
        if (Test-Path $p) { $libs += $p }
    }
    return $libs | Select-Object -Unique
}

function Find-Game {
    $steam = Read-SteamPath
    if (-not $steam) { return $null }
    foreach ($lib in (Get-SteamLibraries $steam)) {
        $candidate = Join-Path $lib 'steamapps\common\STEINS;GATE'
        if (Test-Path $candidate) { return $candidate }
    }
    return $null
}

Clear-Host
Write-Host ""
Write-Host "  ============================================================" -ForegroundColor Magenta
Write-Host "                  Patch FR - Steins;Gate" -ForegroundColor Magenta
Write-Host "                      Desinstallation" -ForegroundColor Magenta
Write-Host "  ============================================================" -ForegroundColor Magenta
Write-Host ""

Write-Step 1 2 "Recherche du jeu..."
$gameDir = Find-Game
if (-not $gameDir) {
    Write-Host ""
    $gameDir = Read-Host "  Chemin du jeu (ex: G:\SteamLibrary\steamapps\common\STEINS;GATE)"
    $gameDir = $gameDir.Trim('"').Trim()
    if (-not (Test-Path $gameDir)) {
        Write-Fail "Chemin invalide."
        Read-Host "  Appuyez sur Entree pour quitter"
        exit 1
    }
}
Write-Ok "Jeu trouve : $gameDir"

Write-Step 2 2 "Restauration des fichiers d'origine..."
$usrDir = Join-Path $gameDir 'USRDIR'
$origScript = Join-Path $usrDir 'script.mpk'
$origSystem = Join-Path $usrDir 'system.mpk'
$backupScript = Join-Path $usrDir 'script.mpk.bak'
$backupSystem = Join-Path $usrDir 'system.mpk.bak'

$missing = @()
if (-not (Test-Path $backupScript)) { $missing += 'script.mpk.bak' }
if (-not (Test-Path $backupSystem)) { $missing += 'system.mpk.bak' }

if ($missing.Count -gt 0) {
    Write-Fail ("Sauvegarde(s) manquante(s) : " + ($missing -join ', '))
    Write-Host ""
    Write-Warn "Verifiez l'integrite des fichiers via Steam pour recuperer la version anglaise."
    Read-Host "  Appuyez sur Entree pour quitter"
    exit 1
}

Copy-Item $backupScript $origScript -Force
Write-Ok "script.mpk restaure depuis la sauvegarde."
Copy-Item $backupSystem $origSystem -Force
Write-Ok "system.mpk restaure depuis la sauvegarde."

Write-Host ""
Write-Host "  ============================================================" -ForegroundColor Green
Write-Host "                  Patch FR desinstalle." -ForegroundColor Green
Write-Host "  ============================================================" -ForegroundColor Green
Write-Host ""
Read-Host "  Appuyez sur Entree pour fermer"
