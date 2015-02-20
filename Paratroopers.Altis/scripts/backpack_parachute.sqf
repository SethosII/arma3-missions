/*
 * Author: SethosII
 * 
 * Purpose:
 * give unit a parachute and save the backpack with content if the unit has one, add the backpack and content again after landing
 *
 * Parameter:
 * _this select 0: unit to add parachute
 *
 * Returns:
 * true when completed
 *
 * Example:
 * _backack_parachute_sqf = [this] execVM "scripts\backack_parachute.sqf";
 */

if (isServer) then {
	[_this, 0, objNull, [objNull]] call BIS_fnc_param;

	private ["_unit", "_backpack"];

	_unit = _this select 0;

	// save the backpack and content of the unit and give it a parachute instead
	_backpack = backpack _unit;
	if (_backpack != "") then {
		removeBackpackGlobal _unit;
	};
	sleep 1;
	_unit addBackpackGlobal "B_Parachute";

	if (_backpack != "") then {
		// wait until landed
		waitUntil {getPosATL _unit select 2 < 1};

		// add backpack and content again
		_unit addBackpackGlobal _backpack;
	};
};

true