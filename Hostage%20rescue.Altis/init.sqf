waitUntil{!(isNil "BIS_fnc_init")};

_hostage_sqf = [hostage, players, detected, guard] execVM "scripts\hostage.sqf";

if (isServer) then {
	positionHostage = [[3795.38,13420.8,8.16792],[3788,13408,4.53342],[3795,13418.5,0.227114]] select floor random 3;
	hostage setPosATL positionHostage;
	bis_curator addCuratorEditableObjects [[hostage], true];
	guard setPosATL [(positionHostage select 0) + 0.75, (positionHostage select 1) - 2, positionHostage select 2];

	kidnapper = [];
	{
		if (side _x == west) then {
			if (_x != guard) then {
				kidnapper pushBack _x;
			};
			bis_curator addCuratorEditableObjects [[_x], true];
		};
	} forEach ([3790,13422] nearObjects ["Man",70]);

	_place_units_in_building_sqf = [kidnapper, [3790,13422], 3] execVM "scripts\place_units_in_building.sqf";
};

// UAV-feed at mission start
if (player != bis_curatorUnit) then {
	[markerPos "hostage", "Hostage position", 100, 100, 0, 0,[]] call BIS_fnc_establishingShot;
};

// Intro message
[
	[
		[format ["%1 %2", rank player, name player],"align = 'center' shadow = '1' size = '1'"],
		["","<br/>"],
		["Hospital of","align = 'center' shadow = '1' size = '0.7'"],
		[" Kavala","align = 'center' shadow = '1' size = '0.7'","#aaaaaa"]
	]
] spawn BIS_fnc_typeText2;