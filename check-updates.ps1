#Requires -Version 5.1
<#
.SYNOPSIS
  Verificador de atualizacoes do Need for Speed: ProStreet.
.DESCRIPTION
  Consulta as fontes oficiais (GitHub) e informa se ha versao mais recente
  dos mods (Fusion Fix, Extra Options, XtendedInput, HD Reflections) em relacao
  ao que esta instalado. NAO baixa nem substitui nada - apenas reporta com o
  manual/URL de onde obter a atualizacao.
.EXAMPLE
  powershell -ExecutionPolicy Bypass -File check-updates.ps1
#>

[CmdletBinding()]
param(
    [string]$GamePath = ''
)

$ErrorActionPreference = 'Continue'
$DefaultGamePath = 'C:\Program Files (x86)\R.G. Mechanics\Need for Speed - ProStreet'

function Write-Step {
    param([string]$Message)
    Write-Host "`n==> $Message" -ForegroundColor Cyan
}

function Get-Str {
    param($Val)
    if ($null -eq $Val) { return '' }
    return "$Val"
}

function Get-GithubJson {
    param([string]$Uri)
    try {
        return Invoke-RestMethod -Uri $Uri -Headers @{ 'User-Agent' = 'ps' } -ErrorAction Stop
    }
    catch {
        Write-Warning "  (erro ao consultar $Uri : $($_.Exception.Message))"
        return $null
    }
}

function Get-LatestAsset {
    param([string]$Repo, [string]$AssetName)
    $rels = Get-GithubJson "https://api.github.com/repos/$Repo/releases?per_page=100"
    if (-not $rels) { return $null }
    return $rels | ForEach-Object {
        $rel = $_
        $a = $rel.assets | Where-Object { $_.name -eq $AssetName }
        if ($a) {
            $d = $null; try { $d = [datetime]$rel.published_at } catch { $d = [datetime]::MinValue }
            [pscustomobject]@{ Tag = (Get-Str $rel.tag_name); Date = $d; Url = (Get-Str $a.browser_download_url) }
        }
    } | Sort-Object Date -Descending | Select-Object -First 1
}

function Get-LatestRelease {
    param([string]$Repo)
    $rel = Get-GithubJson "https://api.github.com/repos/$Repo/releases?per_page=1"
    if (-not $rel -or $rel.Count -eq 0) { return $null }
    $d = $null; try { $d = [datetime]$rel[0].published_at } catch { $d = [datetime]::MinValue }
    return [pscustomobject]@{ Tag = (Get-Str $rel[0].tag_name); Date = $d; Url = "https://github.com/$Repo/releases" }
}

# ---------------------------------------------------------------------------
# 1) Pasta do jogo
# ---------------------------------------------------------------------------
Write-Step 'Pasta do jogo'
if (-not $GamePath) {
    if (Test-Path -LiteralPath $DefaultGamePath) { $GamePath = $DefaultGamePath }
    else { $GamePath = Read-Host 'Digite o caminho da instalacao do jogo (onde fica o nfs.exe)' }
}
if (-not (Test-Path -LiteralPath (Join-Path $GamePath 'nfs.exe'))) {
    throw "Pasta do jogo invalida (nfs.exe nao encontrado): $GamePath"
}
Write-Host "  $GamePath"

$scriptsDir = Join-Path $GamePath 'scripts'

# ---------------------------------------------------------------------------
# 2) Fusion Fix (WidescreenFixesPack)
# ---------------------------------------------------------------------------
Write-Step 'Fusion Fix (ThirteenAG / WidescreenFixesPack)'
$ws = Get-LatestAsset 'ThirteenAG/WidescreenFixesPack' 'NFSProStreet.FusionFix.zip'
if ($ws) {
    Write-Host "  Fonte oficial: $($ws.Url)" -ForegroundColor DarkGray
    $asi = Join-Path $scriptsDir 'NFSProStreet.FusionFix.asi'
    if (Test-Path -LiteralPath $asi) {
        $d = (Get-Item -LiteralPath $asi).LastWriteTime
        Write-Host "  Instalado (asi): $($d.ToString('yyyy-MM-dd HH:mm'))"
        Write-Host "  Data da release oficial: $($ws.Date.ToString('yyyy-MM-dd'))" -ForegroundColor DarkGray
        if ($d -lt $ws.Date) {
            Write-Host "  DESATUALIZADO: avalie atualizar (extraia o zip na pasta do nfs.exe, com backup)." -ForegroundColor Yellow
        }
        else {
            Write-Host "  atualizado." -ForegroundColor Green
        }
    }
    else {
        Write-Host "  .asi nao encontrado." -ForegroundColor Yellow
    }
}

# ---------------------------------------------------------------------------
# 3) Extra Options
# ---------------------------------------------------------------------------
Write-Step 'Extra Options (ExOptsTeam)'
$ex = Get-LatestRelease 'ExOptsTeam/NFSPSExOpts'
if ($ex) {
    Write-Host "  Versao mais recente: $($ex.Tag) ($($ex.Date.ToString('yyyy-MM-dd')))"
    Write-Host "  Baixe em: $($ex.Url)" -ForegroundColor DarkGray
    $asi = Join-Path $scriptsDir 'NFSPSExtraOptions.asi'
    if (Test-Path -LiteralPath $asi) {
        $d = (Get-Item -LiteralPath $asi).LastWriteTime
        Write-Host "  Instalado (asi): $($d.ToString('yyyy-MM-dd HH:mm'))"
        if ($d -lt $ex.Date) {
            Write-Host "  DESATUALIZADO: atualize a partir do site acima (o zip traz NFSPSExtraOptions.asi e o Settings.ini)." -ForegroundColor Yellow
        }
        else {
            Write-Host "  atualizado." -ForegroundColor Green
        }
    }
    else {
        Write-Host "  NFSPSExtraOptions.asi nao encontrado." -ForegroundColor Yellow
    }
}

# ---------------------------------------------------------------------------
# 4) XtendedInput (controle)
# ---------------------------------------------------------------------------
Write-Step 'XtendedInput (xan1242)'
$xi = Get-LatestAsset 'xan1242/NFS-XtendedInput' 'Release-ProStreet-Pack.zip'
$xiAsi = Join-Path $scriptsDir 'NFS_XtendedInput.asi'
if (-not (Test-Path -LiteralPath $xiAsi)) {
    Write-Host "  NAO INSTALADO." -ForegroundColor Yellow
}
elseif ($xi) {
    $d = (Get-Item -LiteralPath $xiAsi).LastWriteTime
    Write-Host "  Instalado: $($d.ToString('yyyy-MM-dd HH:mm'))"
    Write-Host "  Mais recente: $($xi.Tag) ($($xi.Date.ToString('yyyy-MM-dd'))). Zip: $($xi.Url)" -ForegroundColor DarkGray
    if ($d -lt $xi.Date) {
        Write-Host "  DESATUALIZADO: baixe o zip acima e substitua NFS_XtendedInput.asi (mantenha seu .ini/perfil)." -ForegroundColor Yellow
    }
    else {
        Write-Host "  atualizado." -ForegroundColor Green
    }
}

# ---------------------------------------------------------------------------
# 5) HD Reflections
# ---------------------------------------------------------------------------
Write-Step 'HD Reflections (Aero_)'
$hdAsi = Join-Path $scriptsDir 'NFSPSHDReflections.asi'
if (Test-Path -LiteralPath $hdAsi) {
    $d = (Get-Item -LiteralPath $hdAsi).LastWriteTime
    Write-Host "  Instalado (asi): $($d.ToString('yyyy-MM-dd HH:mm'))"
    Write-Host "  Sem release no GitHub (EOL) - checagem manual." -ForegroundColor DarkGray
}
else {
    Write-Host "  NAO INSTALADO." -ForegroundColor Yellow
}
Write-Host "  Pagina/Download: https://nfsmods.xyz/ (extraia NFSPSHDReflections.asi + .ini em scripts\)" -ForegroundColor DarkGray

# ---------------------------------------------------------------------------
# 6) Resumo
# ---------------------------------------------------------------------------
Write-Step 'Pronto!'
Write-Host '  Este script apenas VERIFICA. Nada foi baixado ou alterado.'
Write-Host '  Para atualizar: baixe, faca BACKUP do arquivo atual e substitua.'