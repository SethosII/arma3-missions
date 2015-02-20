/*
 * Author: SethosII
 * 
 * Purpose:
 * make unit sit down
 *
 * Parameter:
 * _this select 0: unit to sit down
 *
 * Returns:
 * true when completed
 *
 * Example:
 * _sit_down_sqf = [this] execVM "scripts\sit_down.sqf";
 */

if (isServer) then {
	[_this, 0, objNull, [objNull]] call BIS_fnc_param;

	private ["_unit"];

	_unit = _this select 0;

	// delay for unit to be placed right
	sleep 1;

	// needed to let unit stay sit down
	_unit setBehaviour "SAFE";
	_unit action ["SitDown", _unit];
};

true