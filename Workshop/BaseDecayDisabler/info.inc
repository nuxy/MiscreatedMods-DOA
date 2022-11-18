TITLE="D.O.A. ★ Base Decay Disabler Mod"
DESCRIPTION=$(cat << EOF
While you cannot fully disable PlotSign decay, you can update the [i]AbandonTimer[/i] field in the game database when character actions occur.  This ensures that as long as any player accesses the game server within a 28 day window, the decay timeout [b]will be extended by another 28 days for ALL bases[/b] on the game server.

[h3] !!! IMPORTANT !!! [/h3]
Note, [b]the mod UGC can be removed at any time[/b] once the SQL trigger has been created.  If left enabled the process will be skipped until the SQL trigger has been removed from the database.

[h1] Compatibility [/h1]
This module only works with the [i]Windows 10[/i] operating system, non-emulated environment.

[h3] Manual install (for unsupported systems) [/h3]
Execute the following SQL statement on the [i]miscreated.db[/i] SQLite database.

[code]
CREATE TRIGGER IF NOT EXISTS PlotSignUpdate AFTER UPDATE ON Characters
BEGIN
    UPDATE Structures SET
        AbandonTimer = 2500000
    WHERE ClassName = "PlotSign";
END;
[/code]

[h1] Installation [/h1]
Add this module to your game server [b]hosting.cfg[/b]
[code] steam_ugc=2890240581 [/code]
EOF
)
CHANGENOTE="[url=https://github.com/nuxy/MiscreatedMods-DOA]Github project[/url]"
FILEID="2890240581"
