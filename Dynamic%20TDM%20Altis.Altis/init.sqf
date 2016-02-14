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
		(_size + [random 360, 0, 0]) execVM "scripts\generate_tdm_area.sqf"; // random
	};
	case 1: {[129, 50, 50, 22630, 16811] execVM "scripts\generate_tdm_area.sqf";}; // Abandoned military outpost
	case 2: {[166, 48, 53, 21499, 10841] execVM "scripts\generate_tdm_area.sqf";}; // Aktinarki Ruins
	case 3: {[84, 218, 17, 15376, 16044] execVM "scripts\generate_tdm_area.sqf";}; // Container
	case 4: {[168, 156, 40, 14319, 18929] execVM "scripts\generate_tdm_area.sqf";}; // Factory near Athira
	case 5: {[200, 100, 50, 13381, 11870] execVM "scripts\generate_tdm_area.sqf";}; // Makrynisi
	case 5: {[154, 212, 43, 17429, 13161] execVM "scripts\generate_tdm_area.sqf";}; // Military Base near Pyrgos
	case 7: {[100, 100, 58,16589, 12793] execVM "scripts\generate_tdm_area.sqf";}; // Offices in Pyrgos
	case 8: {[90, 70, 48, 20861, 16839] execVM "scripts\generate_tdm_area.sqf";}; // Paros
	case 9: {[75, 50, 80, 20962, 19223] execVM "scripts\generate_tdm_area.sqf";}; // Research base
	case 10: {[88, 101, 45, 25655, 21318] execVM "scripts\generate_tdm_area.sqf";}; // Sofia
	case 11: {[170, 165, 40, 27003, 21523] execVM "scripts\generate_tdm_area.sqf";}; // Solar plant
	case 12: {[220, 140, 60, 3503, 12681] execVM "scripts\generate_tdm_area.sqf";}; // South of Kavala
	case 13: {[140, 76, 47, 16755, 12872] execVM "scripts\generate_tdm_area.sqf";}; // Street in Pyrgos
	case 14: {[50, 130, 80, 16036, 16227] execVM "scripts\generate_tdm_area.sqf";}; // Tourist place
	case 15: {[97, 297, 15, 9447, 11704] execVM "scripts\generate_tdm_area.sqf";}; // Zaros
	default {[100, 50, random 360, 0, 0] execVM "scripts\generate_tdm_area.sqf";}; // random
};

[] execVM "scripts\loadouts.sqf";

waitUntil {!(isNil "BIS_fnc_init")};

// Intro message
[
	[
		[format ["%1 %2", rank player, name player],"align = 'center' shadow = '1' size = '1'"],
		["","<br/>"],
		["Somewhere on","align = 'center' shadow = '1' size = '0.7'"],
		[" Altis","align = 'center' shadow = '1' size = '0.7'","#aaaaaa"]
	]
] spawn BIS_fnc_typeText2;

[maxGameTime, maxSideScore] execVM "scripts\end_tdm.sqf";

[maxGameTime] execVM "scripts\display_tdm.sqf";