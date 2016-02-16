// enable BTC revive if parameter is set
/*if (1 == paramsArray select 1) then {
	enableSaving [false,false];
	call compile preprocessFile "=BTC=_revive\=BTC=_revive_init.sqf";
};*/

// UAV-feed at mission start
waitUntil {!(isNil "BIS_fnc_init")};
if (player != bis_curatorUnit) then {
	[markerPos "respawn_west", "Testing ground", 500, 300, 0, 0,[]] call BIS_fnc_establishingShot;
};

// Intro message
[
	[
		[format ["%1 %2", rank player, name player],"align = 'center' shadow = '1' size = '1'"],
		["","<br/>"],
		["Testing ground on","align = 'center' shadow = '1' size = '0.7'"],
		[" Altis","align = 'center' shadow = '1' size = '0.7'","#aaaaaa"]
	]
] spawn BIS_fnc_typeText2;

// marker for the leader
_update_marker_sqf = ["m_players", leader players, 0] execVM "scripts\update_marker.sqf";
