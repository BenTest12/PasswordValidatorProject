#!/usr/bin/env pwsh

$password=$args[0]

if($password.Length -ge 10){
    If ($password -match "[0-9]"){
        If ($password -cmatch "[A-Z]") {
            If ($password -cmatch "[a-z]") {
                Write-Host -BackgroundColor Black -ForegroundColor Green "Strong password (b^_^)b"
            }else{
                Write-Host -BackgroundColor Black -ForegroundColor Red "Please include a Lower case letter"}
        }else{
            Write-Host -BackgroundColor Black -ForegroundColor Red "Please include an Upper case letter"}
    }else{
        Write-Host -BackgroundColor Black -ForegroundColor Red "Please include numbers in your password"}
}else{
    Write-Host -BackgroundColor Black -ForegroundColor Red  "Password not accepted , Password lenght should be greater than or equal 10"}