/*
 * Author: SethosII
 * 
 * Purpose:
 * eject a group out of a vehicle with some delay between each group member
 *
 * Parameter:
 * _this select 0: group to eject
 * _this select 1: vehicle to eject from
 *
 * Returns:
 * true when completed
 *
 * Example:
 * _eject_sqf = [group this, vehicle this] execVM "scripts\eject.sqf";
 */

if (isServer) then {
	params [["_group", grpNull, [grpNull]],
		["_vehicle", objNull, [objNull]]];

	private ["_x"];

	{
		if (vehicle _x != _x) then {
			unassignVehicle _x;
			_x action ["EJECT", _vehicle];
			
			// delay so the units don't pop out at the same time and damage each other
			sleep 0.25;
		}
	} forEach units _group;
};

true
