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

params [["_fireplace", objNull, [objNull]],
	["_type", "", [""]],
	["_trigger", objNull, [objNull]]];

private ["_unit"];

while {true} do {
	waitUntil {triggerActivated _trigger};
	_unit = nearestObject [_fireplace, _type];
	_unit action ["firePutDown", _fireplace];
	waitUntil {!triggerActivated _trigger};
	_unit = nearestObject [_fireplace, _type];
	_unit action ["fireInFlame", _fireplace];
};

true