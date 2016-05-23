// UAV-feed at mission start
waitUntil {!(isNil "BIS_fnc_init")};
[markerPos "marker", "AAF base near Pyrgos", 500, 300, 0, 0,[]] call BIS_fnc_establishingShot;

// Intro message
[
	[
		[format ["%1 %2", rank player, name player],"align = 'center' shadow = '1' size = '1'"],
		["","<br/>"],
		["AAF base near","align = 'center' shadow = '1' size = '0.7'"],
		[" Pyrgos","align = 'center' shadow = '1' size = '0.7'","#aaaaaa"]
	]
] spawn BIS_fnc_typeText2;
