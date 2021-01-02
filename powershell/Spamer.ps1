# Autor: Alejandro López
# Github: github.com/Alopezfu

$wshell = New-Object -ComObject wscript.shell;

function get-help() {
    
    Write-Host "Use command:"
    Write-Host "  .\spam.ps1 num_msg wait_seconds text"
    Write-Host ""
    Write-Host "Example:"
    Write-Host "  .\spam.ps1 10 5 Hola Mundo"
}

function spam {
    
    $s = $args[1]
    While ($s -gt 0) {
        Write-Host 'Start in ... ' $s
        Start-Sleep 1
        $s--
    }

    $i = 1
    While ($i -le $args[0]) {
        $wshell.SendKeys($args[2] + '{ENTER}')
        $i++
    }

}

if (!$args[2]) {
    
    get-help
}
else {

    spam $args[0] $args[1] $args[2]
}
