#!/bin/bash
#
# publish.sh
# Deploy GameSDK modifications to Miscreated Workshop.
#
#  Copyright 2022, Marc S. Brooks (https://mbrooks.info)
#  Licensed under the MIT license:
#  http://www.opensource.org/licenses/mit-license.php
#
# Dependencies:
#   steamcmd
#   git
#   7za
#

TMPDIR=$PWD/tmp

#
# Parse script arguments.
#
argc=$@
argv=0

for value in $argc; do
    case $argv in
        '--username')
            username=$value
            ;;
        '--password')
            password=$value
            ;;
        '--workshop')
            workshop=$value
            ;;
    esac

    argv=$value
done

if [[ -z "$username" ]] || [[ -z "$password" ]] || [[ -z "$workshop" ]]; then
    cat <<EOT
Usage: publish.sh [--username=] [--password=] [--workshop=] [--public]
Options:
  --username : Steam account username.
  --password : Steam account password.
  --workshop : Workshop name to publish.
  --public   : Adds workshop to Steam results (optional).
EOT
    exit 1
fi

#
# Check dependencies.
#
if [ ! `which steamcmd` ]; then
    echo "steamcmd is not installed. Exiting."
    exit 1
fi

if [ ! `which git` ]; then
    echo "git is not installed. Exiting."
    exit 1
fi

if [ ! `which 7za` ]; then
    echo "7za is not installed. Exiting."
    exit 1
fi

#
# Package the release.
#
package=$PWD/Workshop/$workshop

if [ ! -d "$package" ]; then
    echo "Workshop not found. Exiting."
    exit 1
fi

mkdir $TMPDIR

git describe --abbrev=0 > $PWD/VERSION

7za a -tzip -mx0 "$TMPDIR/$workshop.pak" @"$package/MANIFEST" LICENSE VERSION

#
# Create VDF reference.
#
. $package/info.inc

outfile=$PWD/mod.vdf

cat << EOF > $outfile
"workshopitem"
{
  "appid"           "299740"
  "contentfolder"   "$TMPDIR"
  "previewfile"     "$package/preview.png"
  "visibility"      "$([[ $argv == '--public' ]] && echo '0' || echo '3')"
  "title"           "$TITLE"
  "description"     "$DESCRIPTION"
  "changenote"      "$CHANGENOTE"
  "tags"            ""
  "publishedfileid" "$FILEID"
}
EOF

# Publish the package.
steamcmd +login $username $password +workshop_build_item $outfile +quit

# Cleanup build sources.
rm -rf $PWD/mod.vdf $PWD/VERSION $TMPDIR
