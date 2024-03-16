Write-Output "Installing Apps"

$apps = @(
    @{name = "NordSecurity.NordPass" },
    @{name = "Yubico.YubikeyManager" },
    @{name = "Google.Chrome" },
    @{name = "Mozilla.Firefox" },
    @{name = "Brave.Brave" },
    @{name = "Microsoft.VisualStudioCode" },
    @{name = "Spotify.Spotify" },
    @{name = "Microsoft.PowerToys" },
    @{name = "Figma.Figma" },
    @{name = "SlackTechnologies.Slack" },
    @{name = "WhatsApp.WhatsApp"; source = "msstore" },
    @{name = "OpenWhisperSystems.Signal" },
    @{name = "Elgato.ControlCenter" },
    @{name = "Elgato.StreamDeck" },
    @{name = "Elgato.WaveLink" },
    @{name = "Valve.Steam" },
);

Foreach ($app in $apps) {
    $listApp = winget list --exact -q $app.name
    if (![String]::Join("", $listApp).Contains($app.name)) {
        Write-host "Installing: " $app.name
        if ($app.source -ne $null) {
            winget install --exact --silent --accept-source-agreements --accept-package-agreements --id $app.name --source $app.source
        }
        else {
            winget install --exact --silent --accept-source-agreements --accept-package-agreements --id $app.name 
        }
    }
    else {
        Write-host "Skipping: " $app.name " (already installed)"
    }
}