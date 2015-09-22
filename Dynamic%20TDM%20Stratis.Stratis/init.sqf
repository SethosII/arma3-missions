// params
areaPosition = paramsArray select 2;
areaSize = paramsArray select 3;
maxGameTime = paramsArray select 4;
maxSideScore = paramsArray select 5;

// position and size
switch (areaPosition) do {
	case 0: {
		_size = [0,0];
		switch (areaSize) do {
			case 0: {_size = [50,50];};
			case 1: {_size = [100,50];};
			case 2: {_size = [200,100];};
			case 3: {_size = [400,200];};
			case 4: {_size = [500,500];};
		};
		(_size + [random 360, 0, 0, 8200, 8200]) execVM "scripts\generate_tdm_area.sqf"; // random
	};
	case 1: {[138, 82, 79, 2171, 5633, 8200, 8200] execVM "scripts\generate_tdm_area.sqf";}; // Stratis Air Base
	case 2: {[84, 100, 60, 2940, 5940, 8200, 8200] execVM "scripts\generate_tdm_area.sqf";}; // Agia Marina
	case 3: {[77, 80, 0, 3295, 2940, 8200, 8200] execVM "scripts\generate_tdm_area.sqf";}; // Camp Maxwell
	case 4: {[57, 98, 55, 2041, 2713, 8200, 8200] execVM "scripts\generate_tdm_area.sqf";}; // Girna
	default {[100, 50, random 360, 0, 0, 8200, 8200] execVM "scripts\generate_tdm_area.sqf";}; // random
};

[] execVM "scripts\loadouts.sqf";

waitUntil{!(isNil "BIS_fnc_init")};

// Intro message
[
	[
		[format ["%1 %2", rank player, name player],"align = 'center' shadow = '1' size = '1'"],
		["","<br/>"],
		["Somewhere on","align = 'center' shadow = '1' size = '0.7'"],
		[" Stratis","align = 'center' shadow = '1' size = '0.7'","#aaaaaa"]
	]
] spawn BIS_fnc_typeText2;

[maxGameTime, maxSideScore] execVM "scripts\end_tdm.sqf";

[maxGameTime] execVM "scripts\display_tdm.sqf";