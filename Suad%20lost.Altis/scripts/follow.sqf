/*
 * Author: SethosII
 * 
 * Purpose:
 * sets periodically a waypoint to make a group follow another
 *
 * Parameter:
 * _this select 0: group to follow
 * _this select 1: group to be followed
 *
 * Returns:
 * true when completed
 *
 * Example:
 * _follow_sqf = [group this, group player] execVM "scripts\follow.sqf";
 */

if (isServer) then {
	[_this, 0, grpNull, [grpNull]] call BIS_fnc_param;
	[_this, 1, grpNull, [grpNull]] call BIS_fnc_param;

	private ["_follow", "_followed", "_x"];

	_follow = _this select 0;
	_followed = _this select 1;

	while {alive leader _followed} do {
		_follow move position leader _followed;
		sleep 60;
	}
};

true