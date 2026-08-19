#!/bin/bash

#################################################################
#                     rclone
#################################################################
#nikki

rclone bisync --localtime --progress "/home/kamui/Pictures/nikki_screenshots" mega:nikki_screenshots --create-empty-src-dirs --compare size,modtime,checksum --slow-hash-sync-only --resilient -MvP --drive-skip-gdocs --fix-case --resync;
rclone bisync --localtime --progress "/home/kamui/Pictures/Img" mega:img --create-empty-src-dirs --compare size,modtime,checksum --slow-hash-sync-only --resilient -MvP --drive-skip-gdocs --fix-case --resync
rclone bisync --localtime --progress "/home/kamui/Music" mega:Music --create-empty-src-dirs --compare size,modtime,checksum --slow-hash-sync-only --resilient -MvP --drive-skip-gdocs --fix-case --resync
rclone sync --progress "/home/kamui/zettelkasten" mega:zettelkasten
