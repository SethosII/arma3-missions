waitUntil{!(isNil "BIS_fnc_init")};

_nul = [] spawn {_hostage_sqf = [hostage, players, detected, guard] execVM "scripts\hostage.sqf";};

if (isServer) then {
	positionHostage = [[3795.38,13420.8,8.16792],[3786.25,13408.2,4.53342],[3796.02,13418.5,0.227114]] select floor random 3;
	hostage setPosATL positionHostage;
	guard setPosATL [(positionHostage select 0) + 0.5, (positionHostage select 1) - 1.5, positionHostage select 2];

	kidnapper = [];
	{
		if (side _x == west) then {
			kidnapper pushBack _x;
			bis_curator addCuratorEditableObjects [[_x], true];
		};
	} forEach ([3790,13422] nearObjects ["Man",70]);

	positions = [];
	for "_x" from 0 to 60 do {
		positions pushBack _x;
	};

	for "_x" from 0 to count positions - 1 do {
		_y = _x + floor random (count positions - _x);
		_z = positions select _x;
		positions set [_x, positions select _y];
		positions set [_y, _z];
	};

	for "_x" from 0 to count kidnapper - 1 do {
		if (kidnapper select _x != guard) then {
			kidnapper select _x setPosATL ((nearestBuilding [3790,13422]) buildingPos (positions select _x));
		};
		group (kidnapper select _x) setBehaviour "SAFE";
		group (kidnapper select _x) setCombatMode "WHITE";
	};
};

// UAV-feed at mission start
[markerPos "hostage", "Hostage position", 100, 100, 0, 0,[]] call BIS_fnc_establishingShot;

// Intro message
[
	[
		[format ["%1 %2", rank player, name player],"align = 'center' shadow = '1' size = '1'"],
		["","<br/>"],
		["Hospital of","align = 'center' shadow = '1' size = '0.7'"],
		[" Kavala","align = 'center' shadow = '1' size = '0.7'","#aaaaaa"]
	]
] spawn BIS_fnc_typeText2;