param([ValidateSet("up","down")][string]$cmd="up")
if($cmd -eq "up"){ docker compose up -d; Start-Sleep 2; curl.exe -I http://localhost:8080; docker ps } else { docker compose down }
