<#
Uso: Ejecuta este script en PowerShell para aplicar `supabase_setup.sql` en tu base de datos.
El script pedirá la connection URI en formato libpq (postgres://user:pass@host:port/db).
Requisitos: `psql` en PATH (instala PostgreSQL o usa Supabase CLI para obtener una URI).
#>

param(
    [string]$SqlFile = "c:\Users\Augus\wikipediaalejandro\supabase_setup.sql"
)

if (-not (Test-Path $SqlFile)) {
    Write-Error "No se encontró el archivo SQL: $SqlFile"
    exit 2
}

$uri = Read-Host "Introduce la connection URI (ej. postgres://user:pass@host:port/db)"
if ([string]::IsNullOrWhiteSpace($uri)) {
    Write-Error "No se proporcionó connection URI. Abortando."
    exit 3
}

# Verificar psql
if (-not (Get-Command psql -ErrorAction SilentlyContinue)) {
    Write-Host "No se encontró 'psql' en el PATH." -ForegroundColor Yellow
    Write-Host "Opciones: 1) Instala PostgreSQL (incluye psql) 2) Usa Supabase SQL editor 3) Instala Supabase CLI y usa su conexión." -ForegroundColor Yellow
    exit 4
}

Write-Host "Ejecutando $SqlFile contra $uri ..." -ForegroundColor Cyan

# Ejecutar psql
$escapedUri = $uri
$startInfo = @{ArgumentList = @($escapedUri, '-f', $SqlFile); NoNewWindow = $true; Wait = $true}

$proc = Start-Process -FilePath psql -PassThru @startInfo
$proc.WaitForExit()
$code = $proc.ExitCode

if ($code -eq 0) {
    Write-Host "Ejecución completada correctamente." -ForegroundColor Green
    exit 0
} else {
    Write-Error "psql devolvió código de salida $code"
    exit $code
}
