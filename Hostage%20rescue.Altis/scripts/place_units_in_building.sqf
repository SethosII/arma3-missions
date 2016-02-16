/*
 * Author: SethosII
 * 
 * Purpose:
 * move units to random positions inside a building and create random patrols
 *
 * Parameter:
 * _this select 0: array of units to position
 * _this select 1: position of the building
 * _this select 2: number of patrols (optional)
 *
 * Returns:
 * true when completed
 *
 * Example:
 * _place_units_in_building_sqf = [_units, [3790,13422], 3] execVM "scripts\place_units_in_building.sqf";
 */

if (isServer) then {
	params [["_units", [objNull], [[]]],
		["_building", [0,0,0], [[]], [2, 3]],
		["_patrols", 0, [0]]];

	private ["_positions"];

	_positions = [nearestBuilding _building] call BIS_fnc_buildingPositions;

	// shuffle _positions
	for "_x" from 0 to count _positions - 1 do {
		_y = _x + floor random (count _positions - _x);
		_z = _positions select _x;
		_positions set [_x, _positions select _y];
		_positions set [_y, _z];
	};

	// place units
	for "_x" from 0 to count _units - 1 do {
		_units select _x setPosATL (_positions select _x);
		group (_units select _x) setBehaviour "SAFE";
		group (_units select _x) setCombatMode "WHITE";
	};

	// random patrol
	for "_x" from 1 to _patrols do {
		[_x, _units, _positions] spawn {
			while {alive ((_this select 1) select (_this select 0))} do {
				(_this select 1) select (_this select 0) move ((_this select 2) select floor random count (_this select 2));
				sleep random 60;
			};
		};
	};
};

true
