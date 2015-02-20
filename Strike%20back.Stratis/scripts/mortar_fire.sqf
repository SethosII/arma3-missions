/*
 * Author: SethosII
 * 
 * Purpose:
 * fire mortar rounds on a target
 *
 * Parameter:
 * _this select 0: mortar
 * _this select 1: target position
 *
 * Returns:
 * true when completed
 *
 * Example:
 * _mortar_fire_sqf = [this, marker1] execVM "scripts\mortar_fire.sqf";
 */

[_this, 0, objNull, [objNull]] call BIS_fnc_param;
[_this, 1, [0,0,0], [[]], [2, 3]] call BIS_fnc_param;

private ["_mortar", "_target"];

_mortar = _this select 0;
_target = _this select 1;

while {true} do {
	_mortar commandArtilleryFire [_target, getArtilleryAmmo [_mortar] select 0, 3];
	sleep (30 + random 30);
};

true