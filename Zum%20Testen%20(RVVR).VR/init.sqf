// UAV-feed at mission start
waitUntil {!(isNil "BIS_fnc_init")};
if (player != bis_curatorUnit) then {
	[markerPos "sea", "Virtual Reality", 150, 150, 135, 1,[]] call BIS_fnc_establishingShot;
};

// Intro message
[
	[
		[format ["%1 %2", rank player, name player],"align = 'center' shadow = '1' size = '1'"],
		["","<br/>"],
		["Somewhere in the","align = 'center' shadow = '1' size = '0.7'"],
		[" Virtual Reality","align = 'center' shadow = '1' size = '0.7'","#aaaaaa"]
	]
] spawn BIS_fnc_typeText2;
