# Autor: Alejandro López
# Github: github.com/Alopezfu

function get-help() {
    
    Write-Host "Use command:"
    Write-Host "  .\ScanPort.ps1 ipAddress port"
    Write-Host ""
    Write-Host "Example:"
    Write-Host "  .\ScanPort.ps1 8.8.8.8 53"
}

function scan($ip, $port) {
    $outPort = $(Write-Host $ip; Test-NetConnection -InformationLevel Quiet -WarningAction SilentlyContinue $ip -p $port)
    Clear-Host
    Write-Host 'HOST:' $ip
    Write-Host 'PORT:' $port
    Write-Host -NoNewline 'STATUS: '

    if ($outPort -eq "True") {
    
        Write-Host -BackgroundColor Green -ForegroundColor Black ' OPEN ' 
    }
    else {

        Write-Host -BackgroundColor Red -ForegroundColor Black ' CLOSED ' 
    }
    
}

if (!$args[0] -and !$args[1]) {
    
    get-help
}
else {

    scan $args[0] $args[1]
}