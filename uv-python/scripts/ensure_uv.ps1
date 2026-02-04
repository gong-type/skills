param(
  [switch]$NoInstall
)

$ErrorActionPreference = "Stop"

function Test-Command {
  param([Parameter(Mandatory=$true)][string]$Name)
  return [bool](Get-Command $Name -ErrorAction SilentlyContinue)
}

function Invoke-Checked {
  param([Parameter(Mandatory=$true)][string]$Cmd)
  Write-Host $Cmd
  Invoke-Expression $Cmd
}

if (Test-Command "uv") {
  Invoke-Checked "uv --version"
  exit 0
}

Write-Host "uv not found."

if ($NoInstall) {
  Write-Host "NoInstall set; skipping installation."
  exit 2
}

if (-not (Test-Command "scoop")) {
  Write-Host "scoop not found; cannot auto-install uv."
  Write-Host "Install scoop first (or install uv manually), then re-run this script."
  exit 3
}

Invoke-Checked "scoop --version"
Invoke-Checked "scoop install uv"

if (-not (Test-Command "uv")) {
  Write-Host "uv still not found after installation."
  exit 4
}

Invoke-Checked "uv --version"
exit 0

