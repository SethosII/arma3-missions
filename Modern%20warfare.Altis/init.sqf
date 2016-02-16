// UAV-feed at mission start
waitUntil {!(isNil "BIS_fnc_init")};
if (player != bis_curatorUnit) then {
	[markerPos "camp", "BLUFOR camp", 500, 300, 180, 1,[]] call BIS_fnc_establishingShot;
};

// Intro message
[
	[
		[format ["%1 %2", rank player, name player],"align = 'center' shadow = '1' size = '1'"],
		["","<br/>"],
		["Military base near","align = 'center' shadow = '1' size = '0.7'"],
		[" Telos","align = 'center' shadow = '1' size = '0.7'","#aaaaaa"]
	]
] spawn BIS_fnc_typeText2;

if (!isDedicated) then {
	player action ["UAVTerminalOpen", player];
};

[] spawn {
	while {true} do {
		ammoTruck1 setAmmoCargo 1;
		ammoTruck2 setAmmoCargo 1;
		ammoTruck3 setAmmoCargo 1;
		fuelTruck1 setFuelCargo 1;
		fuelTruck2 setFuelCargo 1;
		repairTruck1 setRepairCargo 1;
		repairTruck2 setRepairCargo 1;
		repairTruck3 setRepairCargo 1;
		sleep 2;
	};
};
