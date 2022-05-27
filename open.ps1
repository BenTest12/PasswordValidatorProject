echo "Hello Bootcamp!" > test.txt | notepad.exe test.txt 
$nid = (Get-Process notepad).id

while ($nid -ne $null) {
    Wait-Process -Id $nid
    Remove-Item -LiteralPath "$PSScriptRoot\test.txt" 
    $nid = $null
}