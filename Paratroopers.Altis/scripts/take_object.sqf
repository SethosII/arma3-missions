/*
 * Author: SethosII
 * 
 * Purpose:
 * eject a group out of a vehicle with some delay between each group member
 *
 * Parameter:
 * _this select 0: object with action
 * _this select 1: unit who activated action
 * _this select 2: the action itself
 *
 * Returns:
 * true when completed
 *
 * Example:
 * this addAction ["Take", "scripts\take_object.sqf"];
 */

if (isServer) then {
	[_this, 0, objNull, [objNull]] call BIS_fnc_param;
	[_this, 1, objNull, [objNull]] call BIS_fnc_param;
	[_this, 2, 0, [0]] call BIS_fnc_param;

	private ["_object", "_caller", "_action"];

	_object = _this select 0;
	_caller = _this select 1;
	_action = _this select 2;

	if (side _caller == west) then {
		_object removeAction _action;
		_object setPos [0,0,0]; //deleteObject also deletes variables
		_object setVariable ["taken", true, true];
		_object setVariable ["taken_by", _caller, true];
		detach _object;
		waitUntil {!alive _caller};
		_object setPos getPos _caller;
		_object setVariable ["taken", false, true];
		_object setVariable ["taken_by", objNull, true];
		[ [ [_object] , { (_this select 0) addAction ["Take", "scripts\take_object.sqf"] } ], "BIS_fnc_spawn", true, false, false ] spawn BIS_fnc_MP;
		;
	} else {
		hint "Wrong side!";
	};
};

true