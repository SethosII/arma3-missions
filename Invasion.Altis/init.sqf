// UAV-feed at mission start
waitUntil{!(isNil "BIS_fnc_init")};
[markerPos "marker", "Invasion forces", 100, 300, 240, 0,[]] call BIS_fnc_establishingShot;

// Intro message
[
	[
		[format ["%1 %2", rank player, name player],"align = 'center' shadow = '1' size = '1'"],
		["","<br/>"],
		["South-east of Altis, near","align = 'center' shadow = '1' size = '0.7'"],
		[" coast","align = 'center' shadow = '1' size = '0.7'","#aaaaaa"]
	]
] spawn BIS_fnc_typeText2;