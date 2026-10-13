param([string]$Python = "python")
$ErrorActionPreference = "Stop"
$ProjectRoot = Split-Path -Parent $PSScriptRoot
& $Python -m venv (Join-Path $ProjectRoot ".venv")
if ($LASTEXITCODE -ne 0) { throw "Python virtual environment creation failed." }
$ProjectPython = Join-Path $ProjectRoot ".venv/Scripts/python.exe"
& $ProjectPython -m pip install -r (Join-Path $ProjectRoot "requirements.txt")
if ($LASTEXITCODE -ne 0) { throw "Dependency installation failed." }
Write-Host "Environment ready. Configure compilers and import your original materials next."
