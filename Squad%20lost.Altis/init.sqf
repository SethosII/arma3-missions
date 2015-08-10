// objects to move
_objects = [];
_objects pushBack tent;
_objects pushBack tent2;
{
	_objects pushBack _x;
} forEach units players;
{
	_objects pushBack _x;
} forEach units pursuers1;
{
	_objects pushBack _x;
} forEach units pursuers2;
{
	_objects pushBack _x;
} forEach units pursuers3;

if (isServer) then {
	// possible positions
	_positions = ["pos1", "pos2", "pos3", "pos4", "pos5", "pos6"];
	new_position = getMarkerPos (_positions select floor random count _positions);
	publicVariable "new_position";
};

// delete marker for lost squad
/*if (!(player in units players)) then {
	position_marker = createMarkerLocal ["lastposition", new_position];
	position_marker setMarkerShapeLocal "ICON";
	position_marker setMarkerTypeLocal "hd_objective";
	position_marker setMarkerTextLocal "Last known position.";
};*/

_move_objects_sqf = [_objects, getMarkerPos "reference", new_position, 3000, 3000] execVM "scripts\move_objects.sqf";
_follow_sqf = [pursuers1, players] execVM "scripts\follow.sqf";
_follow_sqf = [pursuers2, players] execVM "scripts\follow.sqf";
_follow_sqf = [pursuers3, players] execVM "scripts\follow.sqf";

// UAV-feed at mission start
waitUntil{!(isNil "BIS_fnc_init")};
[markerPos "base", "BLUFOR base", 500, 300, 0, 0,[]] call BIS_fnc_establishingShot;

// Intro message
if (player in units players) then {
	[
		[
			[format ["%1 %2", rank player, name player],"align = 'center' shadow = '1' size = '1'"],
			["","<br/>"],
			["Somewhere on","align = 'center' shadow = '1' size = '0.7'"],
			[" Altis","align = 'center' shadow = '1' size = '0.7'","#aaaaaa"]
		]
	] spawn BIS_fnc_typeText2;
} else {
	[
		[
			[format ["%1 %2", rank player, name player],"align = 'center' shadow = '1' size = '1'"],
			["","<br/>"],
			["Main airfield on","align = 'center' shadow = '1' size = '0.7'"],
			[" Altis","align = 'center' shadow = '1' size = '0.7'","#aaaaaa"]
		]
	] spawn BIS_fnc_typeText2;	
};