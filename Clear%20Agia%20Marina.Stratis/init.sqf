// UAV-feed at mission start
waitUntil{!(isNil "BIS_fnc_init")};
[markerPos "?", "Agia Marina", 500, 300, 270, 0,[]] call BIS_fnc_establishingShot;
[
	[
		[format [" %1 %2", rank player, name player],"align = 'center' shadow = '1' size = '1'"],
		["","<br/>"],
		["Stratis","align = 'center' shadow = '1' size = '0.7'"],
		[" Air Base","align = 'center' shadow = '1' size = '0.7'","#aaaaaa"]
	]
] spawn BIS_fnc_typeText2;