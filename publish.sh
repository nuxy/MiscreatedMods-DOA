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

fileid=2665400341

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

if [[ -z "$username" ]] && [[ -z "$password" ]]; then
    cat <<EOT
Usage: publish.sh [--username=] [--password=] [--fileid=]
Options:
  --username : Steam account username.
  --password : Steam account password.
  --fileid   : Steam Workshop file ID (default: 2665400341).
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
7za a -tzip -mx0 -xr!.git* -xr!README.md -xr!publish "$PWD/DeadOnArrival.pak" "$PWD/*"

#
# Create VDF reference.
#
outfile=$PWD/DeadOnArrival.vdf

cat << EOF > $outfile
"workshopitem"
{
	"appid"		"299740"
	"contentfolder"		"$PWD"
	"previewfile"		""
	"visibility"		"0"
	"title"		"Miscreated-Mods-DOA"
	"description"		"Modifications for the Miscreated D.O.A. PVP/PVE game server."
	"changenote"		"In progress"
	"tags"		""
	"publishedfileid"		"$fileid"
}
EOF

# Publish the package.
steamcmd +login $username $password +workshop_build_item $outfile +quit

# Cleanup build sources.
rm -f $PWD/DeadOnArrival.*
