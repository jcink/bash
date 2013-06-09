#!/bin/sh
# Clears stuck semaphores
ipcs -s | awk '{ print $2 }' | xargs -n 1 ipcrm sem