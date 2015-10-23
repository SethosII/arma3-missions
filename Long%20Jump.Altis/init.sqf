// UAV-feed at mission start
waitUntil{!(isNil "BIS_fnc_init")};
if (player != bis_curatorUnit) then {
	[markerPos "terminal", "Altis main airfield", 500, 300, 330, 1,[]] call BIS_fnc_establishingShot;
};

// Intro message
[
	[
		[format ["%1 %2", rank player, name player],"align = 'center' shadow = '1' size = '1'"],
		["","<br/>"],
		["In front of the","align = 'center' shadow = '1' size = '0.7'"],
		[" Terminal","align = 'center' shadow = '1' size = '0.7'","#aaaaaa"]
	]
] spawn BIS_fnc_typeText2;