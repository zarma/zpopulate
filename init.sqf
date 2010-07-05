execVM "R3F_revive\revive_init.sqf";

// For the demo mission explanation
//execVM "briefing.sqf";

//#include "R3F_ARTY_AND_LOG\init.sqf"

// initialize functions
call compile preprocessFileLineNumbers  "z_fnc\z_functions.sqf";

setViewDistance 6000;
Z_TYPE_SELECTED="";
z_objects = [];
z_nbobject = 0;
z_unittype = typeOf player;

_nil = [] execVM "z_scripts\z_initconfig.sqf";

centerW = createCenter west;
centerE = createCenter east;
centerG = createCenter resistance;
centerC = createCenter civilian;

player addAction ["Chose object", "z_dialogs\dialog.sqf"];
player addAction ["<t color=""#dddd00"">Selected objects</t>", "z_dialogs\dialogselected.sqf"];
player addAction ["Select Weapon", "wepsel\selectweapon.sqf"];

onMapSingleClick "player setpos _pos";

player setcaptive true;
player allowDamage false;

