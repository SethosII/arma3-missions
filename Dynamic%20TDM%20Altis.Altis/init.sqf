// params
areaPosition = paramsArray select 2;
areaSize = paramsArray select 3;

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
		(_size + [random 360, 0, 0, 22000, 22000]) execVM "scripts\generate_tdm_area.sqf";
	};
	default {[100, 50, random 360, 0, 0, 22000, 22000] execVM "scripts\generate_tdm_area.sqf";};
};
waitUntil{!(isNil "BIS_fnc_init")};

// Intro message
[
	[
		[format ["%1 %2", rank player, name player],"align = 'center' shadow = '1' size = '1'"],
		["","<br/>"],
		["Somewhere on","align = 'center' shadow = '1' size = '0.7'"],
		[" Altis","align = 'center' shadow = '1' size = '0.7'","#aaaaaa"]
	]
] spawn BIS_fnc_typeText2;
