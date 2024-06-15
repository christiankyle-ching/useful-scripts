# Compact Docker Desktop Windows Virtual Disk

When using docker after a long time, unused images and containers can pile up. This script is to compact the .vhd (virtual hard disk) file used by Docker Desktop to save some space.

## How to Run

1. On `cmd`, run `wsl --shutdown` first. This will stop Docker Desktop when running.
2. Run [run.bat](run.bat) in Administrator mode.
3. Wait until finished, might take some time.
