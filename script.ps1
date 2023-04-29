$outputFolder = $PSScriptRoot
$output = Join-Path $outputFolder "output.png"
$resolution = "1920x1080" # Set your desired resolution

while ($true) {
    $timestamp = Get-Date -Format "yyyy-MM-dd HH-mm-ss"

    # Capture the screen with timestamp overlay
    ffmpeg -y -f gdigrab -framerate 1 -video_size $resolution -i desktop -vframes 1 -vf "drawtext=text=""${timestamp}"":x=10:y=10:fontsize=48:fontcolor=white:borderw=2:bordercolor=black" -update 1 $output

    # Print a message indicating the capture
    Write-Host "Captured screen at ${timestamp} and saved to ${output}"

    # Wait 1 minute
    Start-Sleep -Seconds 2
}
