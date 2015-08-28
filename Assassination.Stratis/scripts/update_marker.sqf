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
	params [["_marker", "", [""]],
		["_unit", objNull, [objNull]],
		["_interval", 0, [0]]];

	while {!isNull _unit} do {
		waitUntil {_marker setMarkerPos getPos _unit; true};
		sleep _interval;
	};
};

true