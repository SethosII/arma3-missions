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

params [["_mortar", objNull, [objNull]],
	["_target", [0,0,0], [[]], [2, 3]]];

while {true} do {
	_mortar commandArtilleryFire [_target, getArtilleryAmmo [_mortar] select 0, 3];
	sleep (30 + random 30);
};

true
