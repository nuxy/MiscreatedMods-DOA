TITLE="D.O.A. ★ Alien Invasion ★ PVP/PVE"
DESCRIPTION=$(cat << EOF
Modifications for the [b]Miscreated D.O.A. ★ Alien Invasion ★ PVP/PVE[/b] game server.

[url=https://github.com/nuxy/MiscreatedMods-DOA#miscreatedmods-doa]Project source[/url] ★ [url=https://miscreated-servers.com/server/16803]Game server[/url]

[h1] Notable Changes [/h1]
[list]
  [*]Removed ALL mutants (Human Spiders only, e.g. Aliens).
  [*]Aliens shoot radiating, explosive venom - far distances.
  [*]Balanced Apple, Berries, and Water availabity.
  [*]Updated Plot Sign total items/build radius.
  [*]Updated noob player Spawn Point equipment/inventory items.
  [*][b]Build anywhere, no restrictions[/b].
  [*]Added craftable Metal Safe Storage item.
  [*]Added Glasses Repair Kit item.
  [*]Higher frequency of Random Air Drops, Plane and UFO crashes.
  [*]Updated Food/Random Vendor purchaseable options.
  [*]Updated enemy/horde spawning probability.
  [*]Various Crafting UI improvements, Chat Console additions.
[/list]
.. and [url=https://github.com/nuxy/MiscreatedMods-DOA/commits/master]many others.[/url]

[h1] Survival Tips [/h1]
[list]
  [*]Build a base (or drop Plot Sign). [b]Bases never decay[/b] (must be removed by user).
  [*]Protect your loot with a storage safe. Stores up to 40 items. Requires explosives to raid.
  [*]Carry Antibiotics (Alien venom remedy) which can be purchased in the safe zone.
  [*]Aliens spawn everywhere, including indoors. Be careful when searching loot.
  [*]Only melee Aliens in tight areas. In most cases, long rifles are preferred.
  [*]In many cases running (strafe left/right) is your best defense.
[/list]

[h1] Known Issues [/h1]
[b] Inventory items (Vendor, Storage - Not backpacks) are messed up, or missing [/b]
This is due to a bug [i]in the Miscreated client[/i], not the workshop itself. When you connect from an existing i3D-hosted or third-party server the inventory cache gets corrupted. To mitigate this you need to connect to the game server using a new client session (i.e. launch game, connect to server).

[b] Death when searching a Large Plane Crash (air drop) [/b]
This is due to a bug in the [url=https://steamcommunity.com/workshop/filedetails/?id=1987245557]Large Plane Crash workshop[/url].  Entities may not always being on solid footing (e.g. flatland), or invisible (floating) debris exists which leads to being crushed.  As such the [i]module has been removed[/i] as a dependency of this workshop.
EOF
)
CHANGENOTE="[url=https://github.com/nuxy/MiscreatedMods-DOA]Github project[/url]"
FILEID=2671366315