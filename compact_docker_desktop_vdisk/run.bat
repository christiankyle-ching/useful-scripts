@echo off

cd /d "%~dp0"

echo "Creating script in temp.txt..."

(echo select vdisk file="%localappdata%\Docker\wsl\data\ext4.vhdx"
echo compact vdisk
) > "./temp.txt"

echo "Running diskpart script... See diskpart.log for current status"

C:\Windows\System32\diskpart.exe /s temp.txt > "./diskpart.log"

echo "Done!"

pause
