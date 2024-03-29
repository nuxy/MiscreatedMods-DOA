# MiscreatedMods-DOA

Modifications for the [Miscreated](https://miscreatedgame.com) **D.O.A. ★ Alien Invasion ★ PVP/PVE** [game server](https://miscreated-servers.com/server/17768).

![Steam Demo](https://raw.githubusercontent.com/nuxy/MiscreatedMods-DOA/master/Artwork/demo.gif)

“It was a battleground of fear and curiosity.” - H.G. Wells, The War of the Worlds

## Notable Changes

- Removed ALL mutants (Human Spiders only, e.g. Aliens).
- Aliens shoot radiating, explosive venom - far distances.
- Balanced Apple, Berries, and Water availabity.
- Updated Plot Sign total items/build radius.
- Updated noob player Spawn Point equipment/inventory items.
- Build anywhere, **no restrictions** (bases never decay).
- Higher frequency of hard to find Loot (craftable).
- Updated Food/Random Vendor purchaseable options.
- Updated enemy/horde spawning probability.
- Various Crafting UI improvements, Chat Console additions.

.. and [many others](https://github.com/nuxy/MiscreatedMods-DOA/commits/master).

## Bundled Workshops

The following mods are bundled with this workshop which can also be installed independently on your game server.

- [Alien Invasion](https://steamcommunity.com/sharedfiles/filedetails/?id=2787393227)
- [Base Decay Disabler](https://steamcommunity.com/sharedfiles/filedetails/?id=2890240581)
- [Craftable Metal Storage](https://steamcommunity.com/sharedfiles/filedetails/?id=2787400078)
- [FreeTaxiTeleport](https://steamcommunity.com/sharedfiles/filedetails/?id=2789568378)
- [Glasses Repair Kit](https://steamcommunity.com/sharedfiles/filedetails/?id=2787407832)
- [Spawn Anywhere](https://steamcommunity.com/sharedfiles/filedetails/?id=2787415227)

## Other Dependencies

The following third-party [Miscreated Workshop](https://steamcommunity.com/app/299740/workshop) mods _should be installed_ prior to this package.  These packages are used to enhance the game experience and in some cases have been extended with additional functionality.  Required packages have been identified accordingly, all others being optional.

- [MisDB](https://steamcommunity.com/sharedfiles/filedetails/?id=1841357578) (Required)
- [Base Building Expansion](https://steamcommunity.com/sharedfiles/filedetails/?id=1699198355)
- [Climates of Orca](https://steamcommunity.com/sharedfiles/filedetails/?id=1807643206)
- [Craftable Tents](https://steamcommunity.com/sharedfiles/filedetails/?id=1739418619)
- [Harvest Seeds](https://steamcommunity.com/sharedfiles/filedetails/?id=1676067597)
- [Landscaping](https://steamcommunity.com/sharedfiles/filedetails/?id=1673502088)
- [PVP/PVE Stats](https://steamcommunity.com/sharedfiles/filedetails/?id=1879915972) (Required)

See [hosting.cfg](https://github.com/nuxy/MiscreatedMods-DOA/blob/master/hosting.cfg) for more information.

## Survival Tips

- Build a base (or drop Plot Sign). **Bases never decay** (must be removed by user).
- Protect your loot with a [Storage Safe](https://steamcommunity.com/sharedfiles/filedetails/?id=2787400078). Stores up to 40 items.
- Carry Antibiotics (Alien venom remedy) which can be purchased in the [Safe Zone](https://store.steampowered.com/news/app/299740/view/2463980472079899483).
- Aliens spawn everywhere, including indoors. Be careful when searching loot.
- Only melee Aliens in tight areas. In most cases, long rifles are preferred.
- In many cases running (strafe left/right) is your best defense.

## Known Issues

### Inventory items (Vendor, Storage - Not backpacks) are messed up, or missing

This is due to a bug _in the Miscreated client_, not the workshop itself.  When you connect from an existing i3D hosted or third-party server the inventory cache gets corrupted.  To mitigate this you need to connect to the game server using a new client session (i.e. launch game, connect to server).

That being said, I have created the module [Mods Directory Cleanup](https://steamcommunity.com/sharedfiles/filedetails/?id=2790920967) for this exact purpose.

## References

- [CRYENGINE 3 Manual](https://docs.cryengine.com/display/SDKDOC2/Home)
- [Miscreated C++, Lua Script Bindings](https://github.com/hendrikp/MisScriptBinds)
- [Steam Console Client](https://developer.valvesoftware.com/wiki/SteamCMD)
- [Steam Error Codes](https://steamerrors.com)

## Versioning

This package is maintained under the [Semantic Versioning](https://semver.org) guidelines.

## License and Warranty

This package is distributed in the hope that it will be useful, but without any warranty; without even the implied warranty of merchantability or fitness for a particular purpose.

_MiscreatedMods-DOA_ is provided under the terms of the [MIT license](http://www.opensource.org/licenses/mit-license.php)

[Miscreated](https://miscreatedgame.com) is a product of Entrada Interactive and is not affiliated with this project.

## Author

[Marc S. Brooks](https://github.com/nuxy)
