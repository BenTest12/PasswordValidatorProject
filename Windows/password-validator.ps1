#!/usr/bin/env pwsh

$password=$args[0]

if($password.Length -ge 10){

    Write-Host -BackgroundColor Black -ForegroundColor Green "Strong password (b^_^)b"
}
