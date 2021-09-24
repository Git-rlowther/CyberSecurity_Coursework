#!/bin/bash
cd /usr/local/lynis
./lynis audit system --cronjob > /tmp/lynis.system_scan.log
