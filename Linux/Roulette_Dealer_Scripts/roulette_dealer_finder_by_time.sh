#!/bin/bash
grep "$2" $1* | awk '{print $1, $2, $5, $6 }'

