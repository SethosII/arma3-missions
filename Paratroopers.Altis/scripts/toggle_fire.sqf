/*
 * Author: SethosII
 * 
 * Purpose:
 * put out a fireplace when a trigger is activated and light it up again on deactivation by a given unit type in the surrounding area
 *
 * Parameter:
 * _this select 0: fireplace
 * _this select 1: unit type to search to put out fire
 * _this select 2: trigger to toggle the fire
 *
 * Returns:
 * true when completed
 *
 * Example:
 * _toggle_fire_sqf = [fireplace, "I_soldier_F", seen] execVM "scripts\toggle_fire.sqf";
 */

[_this, 0, objNull, [objNull]] call BIS_fnc_param;
[_this, 1, objNull, [objNull]] call BIS_fnc_param;
[_this, 2, objNull, [objNull]] call BIS_fnc_param;

private ["_fireplace", "_type", "_trigger", "_unit"];

_fireplace = _this select 0;
_type = _this select 1;
_trigger = _this select 2;

while {true} do {
	waitUntil {triggerActivated _trigger};
	_unit = nearestObject [_fireplace, _type];
	_unit action ["firePutDown", _fireplace];
	waitUntil {!triggerActivated _trigger};
	_unit = nearestObject [_fireplace, _type];
	_unit action ["fireInFlame", _fireplace];
};

true