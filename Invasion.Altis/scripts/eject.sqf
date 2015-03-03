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
	[_this, 0, grpNull, [grpNull]] call BIS_fnc_param;
	[_this, 1, objNull, [objNull]] call BIS_fnc_param;

	private ["_group", "_vehicle", "_x"];

	_group = _this select 0;
	_vehicle = _this select 1;

	{
		if (vehicle _x != _x) then {
			unassignVehicle _x;
			_x action ["EJECT", _vehicle];
			
			// delay so the units don't pop out at the same time and damage each other
			sleep 0.75;
		}
	} forEach units _group;
};

true