/*
 * Author: SethosII
 * 
 * Purpose:
 * simulates object taken by a unit
 * sets variables on object to check if it is taken and by whom
 * object will be dropped if the unit dies and the action reattached
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

params [["_object", objNull, [objNull]],
	["_caller", objNull, [objNull]],
	["_action", 0, [0]]];

// move object away and set caller as carrier
[[_object, _action], {(_this select 0) removeAction (_this select 1);}] remoteExec ["BIS_fnc_spawn"];
detach _object; // safety measure
_object setPos [0,0,0]; // deleteObject also deletes variables
_object setVariable ["taken", true, true];
_object setVariable ["taken_by", _caller, true];

waitUntil {!alive _caller};

// place object near dead carrier and add the action again
_object setPos getPos _caller;
_object setVariable ["taken", false, true];
_object setVariable ["taken_by", objNull, true];
[[_object], {(_this select 0) addAction ["Take", "scripts\take_object.sqf"];}] remoteExec ["BIS_fnc_spawn"];

true
