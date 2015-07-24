/*
 * Author: SethosII
 * 
 * Purpose:
 * move all objects in an array to new position and preserve the relative distances between them, also a random placement around the new position is possible
 *
 * Parameter:
 * _this select 0: array with objects to move
 * _this select 1: reference position
 * _this select 2: new position to move to
 * _this select 3: random x (optional)
 * _this select 4: random y (optional)
 *
 * Returns:
 * true when completed
 *
 * Example:
 * _move_objects_sqf = [_objects, _reference_position, _new_position, 3000, 3000] execVM "scripts\move_objects.sqf";
 */

if (isServer) then {
	params[["_objects", [], [[]]],
		["_reference_position", [0,0,0], [[]], [2, 3]],
		["_new_position", [0,0,0], [[]], [2, 3]],
		["_x_delta", 0, [0]],
		["_y_delta", 0, [0]]];

	private ["_relative_positions", "_tempPos", "_x_diff", "_y_diff"];

	_relative_positions = [];
	{
		_tempPos = [];
		if (typeName _x == "OBJECT") then {
			{
				_tempPos pushBack (_x - (_reference_position select _forEachIndex));
			} forEach getPosATL _x;
		} else {
			{
				_tempPos pushBack (_x - (_reference_position select _forEachIndex));
			} forEach getMarkerPos _x;
		};
		_relative_positions pushBack _tempPos;
	} forEach _objects;

	waitUntil{time > 0};

	_x_diff = _x_delta / 2 - random _x_delta;
	_y_diff = _y_delta / 2 - random _y_delta;
	{
		_tempPos = [];
		{
			_tempPos pushBack (_x + (_new_position select _forEachIndex));
		} forEach (_relative_positions select _forEachIndex);
		_tempPos = [(_tempPos select 0) + _x_diff, (_tempPos select 1) + _y_diff, _tempPos select 2];
		if (typeName _x == "OBJECT") then {
			_x setPosATL _tempPos;
		} else {
			_x setMarkerPos _tempPos;
		};
	} forEach _objects;
};

true