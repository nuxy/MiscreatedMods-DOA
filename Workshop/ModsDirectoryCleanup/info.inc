TITLE="D.O.A. ★ Mods Directory Cleanup"
DESCRIPTION=$(cat << EOF
This is a workaround for [b]Steam\steamapps\common\Miscreated\Mods[/b] permissions issue.

On certain [i]Windows 10[/i] setups, when the Miscreated game exits, the contents of the [b]Mods directory are not removed[/b]. This is [b]due to a Steam CMD process lock on downloaded UGC content[/b] that is not removed when the Miscreated game client shuts down.

As result, when connecting to a server that requires a workshop, you receive the error “The required mods to join the server could not be installed“.

This workshop creates a Miscreated [url=https://en.wikipedia.org/wiki/Shortcut_(computing)]Shortcut link[/url] on your Desktop that ensures these [b]files are removed when the game client is started[/b] using this link.

[h3] !!! IMPORTANT !!! [/h3]
Due to a bug in the Miscreated game client you must exit to menu (e.g. “Leave Server“) for this to work. This is due to the client executing a [i]System::Quit[/i] call that completely bypasses game cleanup tasks and garbage collection.

Also note, [b]the mod UGC can be removed at any time[/b] once the [i]Shortcut link[/i] has been created.  If left enabled the process will be skipped until the Desktop [i]Shortcut link[/i] is removed.

[h1] Compatibility [/h1]
While I'm only able to reproduce the issue in [i]Windows 10[/i], based on the many complaints I have read, this seems to be common in other Windows releases.  That said, this package likely works in [i]Windows 7[/i] but has not been tested nor confirmed.

[h1] Installation [/h1]
Add this module to your game server [b]hosting.cfg[/b]
[code] steam_ugc=2790920967 [/code]

[h1] Reporting issues [/h1]
If you are experiencing an issue, or found a bug, you can [url=https://github.com/nuxy/MiscreatedMods-DOA/issues]report it here[/url].
EOF
)
CHANGENOTE="[url=https://github.com/nuxy/MiscreatedMods-DOA]Github project[/url]"
FILEID="2790920967"
