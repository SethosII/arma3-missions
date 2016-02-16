// UAV-feed at mission start
waitUntil {!(isNil "BIS_fnc_init")};
if (player != bis_curatorUnit) then {
	[markerPos "loiter", "Target", 500, 300, 180, 1,[]] call BIS_fnc_establishingShot;
};

// Intro message
[
	[
		[format ["%1 %2", rank player, name player],"align = 'center' shadow = '1' size = '1'"],
		["","<br/>"],
		["Near","align = 'center' shadow = '1' size = '0.7'"],
		[" Nidasos","align = 'center' shadow = '1' size = '0.7'","#aaaaaa"]
	]
] spawn BIS_fnc_typeText2;
