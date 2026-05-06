# Installeur du patch FR pour Steins;Gate (Steam, app id 412830)
# ---------------------------------------------------------------
# Localise le jeu, sauvegarde les fichiers d'origine, copie la VF.
# A lancer via install.bat (ou directement : powershell -ExecutionPolicy Bypass -File install.ps1)

$ErrorActionPreference = 'Stop'

function Write-Step($n, $total, $msg) {
    Write-Host ""
    Write-Host "[$n/$total] $msg" -ForegroundColor Cyan
}

function Write-Ok($msg) {
    Write-Host "      $msg" -ForegroundColor Green
}

function Write-Warn($msg) {
    Write-Host "      $msg" -ForegroundColor Yellow
}

function Write-Fail($msg) {
    Write-Host "      $msg" -ForegroundColor Red
}

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
    if (-not $steam) {
        Write-Warn "Steam introuvable dans le registre."
        return $null
    }

    $libs = Get-SteamLibraries $steam
    foreach ($lib in $libs) {
        $candidate = Join-Path $lib 'steamapps\common\STEINS;GATE'
        if (Test-Path $candidate) { return $candidate }
    }
    return $null
}

# -------- Banniere --------
Clear-Host
Write-Host ""
Write-Host "  ============================================================" -ForegroundColor Magenta
Write-Host "                  Patch FR - Steins;Gate" -ForegroundColor Magenta
Write-Host "                       Installation" -ForegroundColor Magenta
Write-Host "  ============================================================" -ForegroundColor Magenta
Write-Host ""
Write-Host "  Ce script va :" -ForegroundColor Gray
Write-Host "    - reperer votre installation Steam du jeu (app id 412830)" -ForegroundColor Gray
Write-Host "    - sauvegarder les fichiers originaux (script.mpk, system.mpk)" -ForegroundColor Gray
Write-Host "    - copier la traduction francaise par-dessus" -ForegroundColor Gray
Write-Host ""

# -------- Verifie les MPK --------
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$repoRoot = Split-Path -Parent $scriptDir
$frScript = Join-Path $repoRoot 'patch\script.mpk'
$frSystem = Join-Path $repoRoot 'patch\system.mpk'

if (-not (Test-Path $frScript)) {
    Write-Fail "Fichier introuvable : $frScript"
    Write-Host ""
    Write-Host "  Verifiez que le dossier 'patch' est bien a cote du dossier 'installer'." -ForegroundColor Red
    Read-Host "  Appuyez sur Entree pour quitter"
    exit 1
}
if (-not (Test-Path $frSystem)) {
    Write-Fail "Fichier introuvable : $frSystem"
    Write-Host ""
    Write-Host "  Verifiez que vous avez bien telecharge l'archive .zip complete depuis" -ForegroundColor Red
    Write-Host "  l'onglet Releases du depot GitHub. Le 'system.mpk' (~133 Mo) n'est pas" -ForegroundColor Red
    Write-Host "  inclus dans le code source - uniquement dans la release." -ForegroundColor Red
    Read-Host "  Appuyez sur Entree pour quitter"
    exit 1
}

# -------- 1/4 : Localisation du jeu --------
Write-Step 1 4 "Recherche du jeu..."
$gameDir = Find-Game

if (-not $gameDir) {
    Write-Warn "Detection automatique : echec."
    Write-Host ""
    Write-Host "  Indiquez le chemin du jeu manuellement." -ForegroundColor Yellow
    Write-Host "  Exemple : G:\SteamLibrary\steamapps\common\STEINS;GATE" -ForegroundColor DarkGray
    Write-Host ""
    $gameDir = Read-Host "  Chemin"
    $gameDir = $gameDir.Trim('"').Trim()
    if (-not (Test-Path $gameDir)) {
        Write-Fail "Le chemin n'existe pas : $gameDir"
        Read-Host "  Appuyez sur Entree pour quitter"
        exit 1
    }
}
Write-Ok "Jeu trouve : $gameDir"

# -------- 2/4 : Verification de la structure --------
Write-Step 2 4 "Verification de la structure du jeu..."
$usrDir = Join-Path $gameDir 'USRDIR'
$origScript = Join-Path $usrDir 'script.mpk'
$origSystem = Join-Path $usrDir 'system.mpk'

if (-not (Test-Path $usrDir)) {
    Write-Fail "Le dossier 'USRDIR' est absent."
    Write-Host ""
    Write-Host "  Le dossier indique ne ressemble pas a une installation valide de Steins;Gate." -ForegroundColor Red
    Write-Host "  Verifiez que vous avez bien la version Steam (app id 412830) et pas Elite ou autre." -ForegroundColor Red
    Read-Host "  Appuyez sur Entree pour quitter"
    exit 1
}
if (-not (Test-Path $origScript)) {
    Write-Fail "script.mpk introuvable dans USRDIR."
    Read-Host "  Appuyez sur Entree pour quitter"
    exit 1
}
if (-not (Test-Path $origSystem)) {
    Write-Fail "system.mpk introuvable dans USRDIR."
    Read-Host "  Appuyez sur Entree pour quitter"
    exit 1
}
Write-Ok "Structure du jeu valide."

# -------- 3/4 : Sauvegardes --------
Write-Step 3 4 "Sauvegarde des fichiers originaux..."

$backupScript = Join-Path $usrDir 'script.mpk.bak'
$backupSystem = Join-Path $usrDir 'system.mpk.bak'

if (Test-Path $backupScript) {
    Write-Ok "Sauvegarde deja presente (script.mpk.bak), conservee telle quelle."
} else {
    Copy-Item $origScript $backupScript
    Write-Ok "Sauvegarde creee : script.mpk.bak"
}
if (Test-Path $backupSystem) {
    Write-Ok "Sauvegarde deja presente (system.mpk.bak), conservee telle quelle."
} else {
    Copy-Item $origSystem $backupSystem
    Write-Ok "Sauvegarde creee : system.mpk.bak"
}

# -------- 4/4 : Installation --------
Write-Step 4 4 "Application du patch FR..."
Copy-Item $frScript $origScript -Force
$sizeScript = (Get-Item $origScript).Length
Write-Ok ("script.mpk remplace ({0:N0} octets)." -f $sizeScript)

Copy-Item $frSystem $origSystem -Force
$sizeSystem = (Get-Item $origSystem).Length
Write-Ok ("system.mpk remplace ({0:N0} octets)." -f $sizeSystem)

# -------- Final --------
Write-Host ""
Write-Host "  ============================================================" -ForegroundColor Green
Write-Host "                    Installation terminee !" -ForegroundColor Green
Write-Host "  ============================================================" -ForegroundColor Green
Write-Host ""
Write-Host "  Lancez le jeu normalement via Steam." -ForegroundColor White
Write-Host "  Le texte du jeu est desormais en francais." -ForegroundColor White
Write-Host ""
Write-Host "  Pour revenir a l'anglais : lancez uninstall.bat" -ForegroundColor DarkGray
Write-Host ""
Read-Host "  Appuyez sur Entree pour fermer"
