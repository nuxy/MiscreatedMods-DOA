#!/bin/bash
#
# Deploy GameSDK modifications to Miscreated Workshop.
#
# Dependencies:
#   steamcmd
#   7za
#

STEAM_USERNAME=""
STEAM_PASSWORD=""
STEAM_FILEID="2665482259" # or 2665400341 (Testing)

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
	"publishedfileid"		"$STEAM_FILEID"
}
EOF

# Publish the package.
steamcmd +login $STEAM_USERNAME $STEAM_PASSWORD +workshop_build_item $outfile +quit

# Cleanup build sources.
rm -f $PWD/DeadOnArrival.*
