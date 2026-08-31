#Requires -Version 5.1
<#
.SYNOPSIS
  Aplica a configuracao dos mods do Need for Speed: ProStreet.
.DESCRIPTION
  Copia os mods deste repo (Mods\) para a pasta do jogo, com verificacao do
  nfs.exe, e ajusta o NFSProStreet.FusionFix.ini (idioma PT-BR, camera livre
  OFF, desliga motion blur, gamma de console). Rode como Administrador se o
  jogo estiver em "Program Files".
.EXAMPLE
  powershell -ExecutionPolicy Bypass -File setup-config.ps1
  powershell -ExecutionPolicy Bypass -File setup-config.ps1 -EnableCamera
  powershell -ExecutionPolicy Bypass -File setup-config.ps1 -GamePath "X:\nfs prostreet"
#>

[CmdletBinding()]
param(
    [string]$GamePath = 'C:\Program Files (x86)\R.G. Mechanics\Need for Speed - ProStreet',
    [switch]$EnableCamera,
    [switch]$SkipPrompts
)

$ErrorActionPreference = 'Stop'
$RepoRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$ModsRoot = Join-Path $RepoRoot 'Mods'

function Write-Step {
    param([string]$Message)
    Write-Host "`n==> $Message" -ForegroundColor Cyan
}

function Copy-To {
    param([string]$From, [string]$To, [string]$Name)
    if (-not (Test-Path -LiteralPath (Join-Path $From $Name))) {
        throw "Arquivo nao encontrado: $From\$Name"
    }
    Copy-Item -LiteralPath (Join-Path $From $Name) -Destination $To -Force
    Write-Host "  copiado: $Name"
}

function Set-IniKey {
    param([string]$Ini, [string]$Section, [string]$Key, [string]$Value)
    $lines = Get-Content -LiteralPath $Ini
    $out = New-Object System.Collections.Generic.List[string]
    $inSection = $false
    $found = $false
    foreach ($l in $lines) {
        $trimmed = $l.Trim()
        if ($trimmed -match '^\[.*\]$') {
            $inSection = ($trimmed -eq "[$Section]")
            $out.Add($l)
        }
        elseif ($inSection -and $trimmed -match "^$Key\s*=") {
            $out.Add("$Key = $Value")
            $found = $true
        }
        else {
            $out.Add($l)
        }
    }
    if (-not $found) {
        $idx = 0
        for ($i = 0; $i -lt $out.Count; $i++) {
            if ($out[$i].Trim() -eq "[$Section]") { $idx = $i + 1; break }
        }
        $out.Insert($idx, "$Key = $Value")
    }
    Set-Content -LiteralPath $Ini -Value $out
    Write-Host "  ini ajustado: [$Section] $Key = $Value ($(if ($found) {'chave existia'} else {'chave nova'}))"
}

# ---------------------------------------------------------------------------
# 1) Jogo
# ---------------------------------------------------------------------------
Write-Step 'Pasta do jogo'
if (-not (Test-Path -LiteralPath (Join-Path $GamePath 'nfs.exe'))) {
    if ($SkipPrompts) { throw "nfs.exe nao encontrado em: $GamePath" }
    $GamePath = Read-Host "nfs.exe nao encontrado. Digite o caminho da instalacao (ex: C:\Program Files (x86)\R.G. Mechanics\Need for Speed - ProStreet)"
    if (-not (Test-Path -LiteralPath (Join-Path $GamePath 'nfs.exe'))) {
        throw "nfs.exe nao encontrado em: $GamePath"
    }
}
Write-Host "  $GamePath (nfs.exe ok)"
$scriptsDir = Join-Path $GamePath 'scripts'
New-Item -ItemType Directory -Force -Path $scriptsDir | Out-Null
New-Item -ItemType Directory -Force -Path (Join-Path $GamePath 'GLOBAL') | Out-Null

# ---------------------------------------------------------------------------
# 2) ASI Loader (dinput8.dll)
# ---------------------------------------------------------------------------
Write-Step 'ASI Loader (dinput8.dll)'
Copy-To (Join-Path $ModsRoot 'ASI-Loader') $GamePath 'dinput8.dll'

# ---------------------------------------------------------------------------
# 3) Fusion Fix (WidescreenFixesPack)
# ---------------------------------------------------------------------------
Write-Step 'Fusion Fix (ThirteenAG)'
Copy-To (Join-Path $ModsRoot 'FusionFix') $scriptsDir 'NFSProStreet.FusionFix.asi'
$fusIni = Join-Path $scriptsDir 'NFSProStreet.FusionFix.ini'
Copy-To (Join-Path $ModsRoot 'FusionFix') $scriptsDir 'NFSProStreet.FusionFix.ini'
Set-IniKey $fusIni 'LANGUAGE' 'Language' 'Mexican Spanish'
Set-IniKey $fusIni 'MISC' 'DisableMotionBlur' '1'
Set-IniKey $fusIni 'GRAPHICS' 'ConsoleGamma' '1'
if ($EnableCamera) { Set-IniKey $fusIni 'CAMERA' 'Enable' '1' }
else { Set-IniKey $fusIni 'CAMERA' 'Enable' '0' }

# ---------------------------------------------------------------------------
# 4) Extra Options
# ---------------------------------------------------------------------------
Write-Step 'Extra Options'
Copy-To (Join-Path $ModsRoot 'ExtraOptions') $scriptsDir 'NFSPSExtraOptions.asi'
Copy-To (Join-Path $ModsRoot 'ExtraOptions') $scriptsDir 'NFSPSExtraOptionsSettings.ini'

# ---------------------------------------------------------------------------
# 5) XtendedInput
# ---------------------------------------------------------------------------
Write-Step 'XtendedInput'
Copy-To (Join-Path $ModsRoot 'XtendedInput') $scriptsDir 'NFS_XtendedInput.asi'
Copy-To (Join-Path $ModsRoot 'XtendedInput') $scriptsDir 'NFS_XtendedInput.ini'
Copy-To (Join-Path $ModsRoot 'XtendedInput') $scriptsDir 'nfs_cursor.cur'
Copy-To (Join-Path $ModsRoot 'XtendedInput') (Join-Path $GamePath 'GLOBAL') 'XtendedInputButtons.tpk'
Copy-To (Join-Path $ModsRoot 'XtendedInput') $GamePath 'EventReference.txt'

# ---------------------------------------------------------------------------
# 6) HD Reflections
# ---------------------------------------------------------------------------
Write-Step 'HD Reflections'
Copy-To (Join-Path $ModsRoot 'HDReflections') $scriptsDir 'NFSPSHDReflections.asi'
Copy-To (Join-Path $ModsRoot 'HDReflections') $scriptsDir 'NFSPSHDReflections.ini'

# ---------------------------------------------------------------------------
# 7) Resumo
# ---------------------------------------------------------------------------
Write-Step 'Concluido!'
Write-Host "  Mods aplicados em: $GamePath"
Write-Host '  Para abrir o jogo: pasta do nfs.exe -> nfs.exe.'
if ($EnableCamera) {
    Write-Host '  Camera livre ATIVADA.' -ForegroundColor Green
}
else {
    Write-Host '  Camera livre DESLIGADA.' -ForegroundColor DarkGray
}
Write-Host '  IMPORTANTE: a traducao PT-BR (GameVicio) usa o idioma "Mexican Spanish" - ja ajustado no FusionFix.ini.'
Write-Host '  IMPORTANTE: sem o exe crackeado/v1.1 (sem SecuROM) o jogo nao abre no Win10/11.'
Write-Host '  Para atualizar os mods depois: rode check-updates.ps1' -ForegroundColor DarkGray