#!/bin/bash
##Prints the amount of free memory on the system and saves it to `~/backups/freemem/free_mem.txt`.
free > ~/backups/freemem/free_mem.txt
##Prints disk usage and saves it to `~/backups/diskuse/disk_usage.txt`
df -h > ~/backups/diskuse/diskusage.txt
##Lists all open files and saves it to `~/backups/openlist/open_list.txt`
lsof > ~/backups/openlist/open_list.txt
##Prints file system disk space statistics and saves it to `~/backups/freedisk/free_disk.txt`
du -h > ~/backups/freedisk/free_disk.txt

