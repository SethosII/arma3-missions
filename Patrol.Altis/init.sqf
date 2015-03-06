// UAV-feed at mission start
waitUntil{!(isNil "BIS_fnc_init")};
[markerPos "fia_6", "South of Altis", 500, 600, 30, 0,[]] call BIS_fnc_establishingShot;

// Intro message
[
	[
		[format [" %1 %2", rank player, name player],"align = 'center' shadow = '1' size = '1'"],
		["","<br/>"],
		["South of","align = 'center' shadow = '1' size = '0.7'"],
		[" Altis","align = 'center' shadow = '1' size = '0.7'","#aaaaaa"]
	]
] spawn BIS_fnc_typeText2;