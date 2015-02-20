/*
 * Author: SethosII
 * 
 * Purpose:
 * attaches a marker to a given object and updates it in the given interval
 *
 * Parameter:
 * _this select 0: marker
 * _this select 1: unit to attach marker to
 * _this select 2: update interval
 *
 * Returns:
 * true when completed
 *
 * Example:
 * _update_marker_sqf = ["marker_unit", unit, 5] execVM "scripts\update_marker.sqf";
 */

if (isServer) then {
	[_this, 0, "", [""]] call BIS_fnc_param;
	[_this, 1, objNull, [objNull]] call BIS_fnc_param;
	[_this, 2, 0, [0]] call BIS_fnc_param;

	private ["_marker", "_unit", "_interval"];

	_marker = _this select 0;
	_unit = _this select 1;
	_interval = _this select 2;

	while {!isNull _unit} do {
		waitUntil {_marker setMarkerPos getPos _unit; true};
		sleep _interval;
	};
};

true