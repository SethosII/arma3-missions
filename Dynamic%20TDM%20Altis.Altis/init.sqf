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
		(_size + [random 360, 0, 0, 22000, 22000]) execVM "scripts\generate_tdm_area.sqf";
	};
	case 1: {[220, 140, 60, 3503, 12681, 22000, 22000] execVM "scripts\generate_tdm_area.sqf";};
	case 2: {[154, 212, 43, 17429, 13161, 22000, 22000] execVM "scripts\generate_tdm_area.sqf";};
	case 3: {[168, 156, 40, 14319, 18929, 22000, 22000] execVM "scripts\generate_tdm_area.sqf";};
	case 4: {[84, 218, 17, 15376, 16044, 22000, 22000] execVM "scripts\generate_tdm_area.sqf";};
	case 5: {[166, 48, 53, 21499, 10841, 22000, 22000] execVM "scripts\generate_tdm_area.sqf";};
	case 6: {[100, 100, 58,16589, 12793, 22000, 22000] execVM "scripts\generate_tdm_area.sqf";};
	case 7: {[140, 76, 47, 16755, 12872, 22000, 22000] execVM "scripts\generate_tdm_area.sqf";};
	default {[100, 50, random 360, 0, 0, 22000, 22000] execVM "scripts\generate_tdm_area.sqf";};
};
waitUntil{!(isNil "BIS_fnc_init")};

// set end time
if(isServer && maxGameTime != 0) then {
	estimatedTimeLeft maxGameTime;
};

// Intro message
[
	[
		[format ["%1 %2", rank player, name player],"align = 'center' shadow = '1' size = '1'"],
		["","<br/>"],
		["Somewhere on","align = 'center' shadow = '1' size = '0.7'"],
		[" Altis","align = 'center' shadow = '1' size = '0.7'","#aaaaaa"]
	]
] spawn BIS_fnc_typeText2;

[] spawn {
	waitUntil {maxSideScore != 0 && (scoreSide west >= maxSideScore || scoreSide east >= maxSideScore || scoreSide independent >= maxSideScore) || maxGameTime != 0 && serverTime > estimatedEndServerTime};

	scores = [[scoreSide west,west],[scoreSide east,east],[scoreSide independent, independent]];
	scores sort false;
	scores = scores; // scores is otherwise undefined after sorting
	message = format ["%1 wins with %2 points!", scores select 0 select 1, scores select 0 select 0];
	winner = scores select 0 select 1;
	if (scores select 0 select 0 == scores select 1 select 0) then {
		message = "Tie!";
		winner = civilian;
	};

	if (side player == winner) then {
		"END1" call BIS_fnc_endMission;
	} else {
		["LOSE",false] call BIS_fnc_endMission;
	};
	hint format["%1\n\n1. %2: %3\n2. %4: %5\n3. %6 %7", message, scores select 0 select 1, scores select 0 select 0, scores select 1 select 1, scores select 1 select 0, scores select 2 select 1, scores select 2 select 0];
	end = true;
};