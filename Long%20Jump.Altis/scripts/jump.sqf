/*
 * Author: SethosII
 * 
 * Purpose:
 * measure distance and time of a jump
 *
 * Parameter:
 * _this select 0: unit to measure
 *
 * Returns:
 * true when completed
 *
 * Example:
 * _jump_sqf = [this] execVM "scripts\jump.sqf";
 */

[_this, 0, objNull, [objNull]] call BIS_fnc_param;

private ["_unit", "_pos", "_time", "_distance"];

_unit = _this select 0;

while {true} do {
	waitUntil {!isTouchingGround vehicle _unit && !(vehicle _unit isKindOf "Air")};
	_pos = getPos vehicle player;
	_time = time;
	waitUntil {isTouchingGround vehicle _unit};
	_distance = getPos vehicle _unit distance _pos;
	_time = time - _time;
	if (_distance > 10 && _time > 0.5) then {
		"Jump statistics:" hintC [format ["Distance: %1", _distance], format ["Time: %1", _time]];
	};
};

true