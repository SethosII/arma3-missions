// UAV-feed at mission start
waitUntil {!(isNil "BIS_fnc_init")};
if (player != bis_curatorUnit) then {
	[markerPos "enemy", "Agios Dionysios", 500, 300, 0, 0,[]] call BIS_fnc_establishingShot;
};

// Intro message
[
	[
		[format ["%1 %2", rank player, name player],"align = 'center' shadow = '1' size = '1'"],
		["","<br/>"],
		["South of","align = 'center' shadow = '1' size = '0.7'"],
		[" Agios Dionysios","align = 'center' shadow = '1' size = '0.7'","#aaaaaa"]
	]
] spawn BIS_fnc_typeText2;
