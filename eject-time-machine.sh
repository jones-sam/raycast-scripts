#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Eject Time Machine
# @raycast.mode compact

# Optional parameters:
# @raycast.icon ⏱️

# Documentation:
# @raycast.author Sam Jones
# @raycast.authorURL https://github.com/jones-sam

volume="APFS Volume Extreme SSD"
if diskutil list external virtual | ack "$volume" &> /dev/null ; then
    if tmutil currentPhase | ack "BackupNotRunning" &> /dev/null ; then
        diskutil unmount "Extreme SSD"
    else
        echo "Time Machine backup in progress"; exit 1
    fi
else
    echo "Time Machine drive not mounted" ; exit 1
fi
