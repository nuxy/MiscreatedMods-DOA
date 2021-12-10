#!/bin/bash
#
# publish.sh
# Deploy GameSDK modifications to Miscreated Workshop.
#
#  Copyright 2021, Marc S. Brooks (https://mbrooks.info)
#  Licensed under the MIT license:
#  http://www.opensource.org/licenses/mit-license.php
#
# Dependencies:
#   steamcmd
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
        '--fileid')
            fileid=$value
            ;;
    esac

    argv=$value
done

if [[ -z "$username" ]] || [[ -z "$password" ]] || [[ -z "$fileid" ]]; then
    cat <<EOT
Usage: publish.sh [--username=] [--password=] [--fileid=]
Options:
  --username : Steam account username.
  --password : Steam account password.
  --fileid   : Steam Workshop file ID.
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

if [ ! `which 7za` ]; then
  echo "7za is not installed. Exiting."
  exit 1
fi

#
# Package the release.
#
mkdir $TMPDIR

7za a -tzip -mx0 -xr!.git* -xr!hosting.cfg -xr!LICENSE -xr!D.O.A.* -xr!README.md -xr!publish.sh -xr!tmp "$TMPDIR/DeadOnArrival.pak" "$PWD/*"

#
# Create VDF reference.
#
outfile=$PWD/mod.vdf

cat << EOF > $outfile
"workshopitem"
{
  "appid"           "299740"
  "contentfolder"   "$TMPDIR"
  "previewfile"     "$PWD/preview.png"
  "visibility"      "$([[ $argv == '--public' ]] && echo '0' || echo '3')"
  "title"           "D.O.A. ★ Alien Invasion"
  "description"     "Modifications for the Miscreated D.O.A. ★ Alien Invasion ★ PVP/PVE game server."
  "changenote"      "[url=https://github.com/nuxy/MiscreatedMods-DOA]Github project[/url]"
  "tags"            ""
  "publishedfileid" "$fileid"
}
EOF

# Publish the package.
steamcmd +login $username $password +workshop_build_item $outfile +quit

# Cleanup build sources.
rm -rf $PWD/mod.vdf $TMPDIR
