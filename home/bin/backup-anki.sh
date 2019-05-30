#!/bin/bash
set -uxe

ankiBackupsDir="/home/vackosar/.local/share/Anki2/User 1/backups/";
cp "$ankiBackupsDir/$(ls -1t "$ankiBackupsDir"|sed 1q)" "/home/vackosar/dropbox/bkp/ankiBackup.colpkg";
