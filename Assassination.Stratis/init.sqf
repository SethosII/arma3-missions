// UAV-feed at mission start
waitUntil{!(isNil "BIS_fnc_init")};
if (player != bis_curatorUnit) then {
	[markerPos "officer", "Airbase of Stratis", 500, 400, 0, 0,[]] call BIS_fnc_establishingShot;
};

// Intro message
if (player in units assassins) then {
	[
		[
			[format ["%1 %2", rank player, name player],"align = 'center' shadow = '1' size = '1'"],
			["","<br/>"],
			["At","align = 'center' shadow = '1' size = '0.7'"],
			[" Camp Maxwell","align = 'center' shadow = '1' size = '0.7'","#aaaaaa"]
		]
	] spawn BIS_fnc_typeText2;
} else {
	[
		[
			[format ["%1 %2", rank player, name player],"align = 'center' shadow = '1' size = '1'"],
			["","<br/>"],
			["At","align = 'center' shadow = '1' size = '0.7'"],
			[" Stratis airbase","align = 'center' shadow = '1' size = '0.7'","#aaaaaa"]
		]
	] spawn BIS_fnc_typeText2;	
};

// disable radio trigger for blufor
if (side player == west) then {
	1 setRadioMsg "NULL";
};

// marker for the officer
_update_marker_sqf = ["officer", officer_unit, 60] execVM "scripts\update_marker.sqf";