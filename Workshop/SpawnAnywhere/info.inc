TITLE="D.O.A. ★ Spawn Anywhere Mod"
DESCRIPTION=$(cat << EOF
Create custom Spawn Points that override in-game defaults.

[h1] Mod Info [/h1]
[list]
  [*]Can be managed using the [i]Chat console[/i].
  [*]Supports unlimited instances.
[/list]

[h1] Commands [/h1]
[code]
!sp save <name>
!sp delete <RECORDID>
!sp list
[/code]

[h1] Dependencies [/h1]
[list]
  [*][url=https://steamcommunity.com/sharedfiles/filedetails/?id=1942750114]mFramework[/url]
  [*][url=https://steamcommunity.com/sharedfiles/filedetails/?id=1841357578]MisDB[/url]
[/list]

[h1] Installation [/h1]
Add this module to your game server [b]hosting.cfg[/b]. Note the UGC order below.
[code] steam_ugc=1942750114,1841357578,2787415227 [/code]
EOF
)
CHANGENOTE="[url=https://github.com/nuxy/MiscreatedMods-DOA]Github project[/url]"
FILEID="2787415227"
