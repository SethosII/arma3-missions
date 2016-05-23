// UAV-feed at mission start
waitUntil {!(isNil "BIS_fnc_init")};
[markerPos "marker", "Main airbase", 500, 300, 0, 0,[]] call BIS_fnc_establishingShot;

// Intro message
[
	[
		[format ["%1 %2", rank player, name player],"align = 'center' shadow = '1' size = '1'"],
		["","<br/>"],
		["Main","align = 'center' shadow = '1' size = '0.7'"],
		[" airbase","align = 'center' shadow = '1' size = '0.7'","#aaaaaa"]
	]
] spawn BIS_fnc_typeText2;

[] spawn {
	while {true} do {
		zamakRepair setRepairCargo 1;
		zamakFuel setFuelCargo 1;
		zamakAmmo1 setAmmoCargo 1;
		zamakAmmo2 setAmmoCargo 1;
		sleep 2;
	};
};
