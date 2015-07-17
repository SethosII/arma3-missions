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
	params[["_follow", grpNull, [grpNull]],
		["_followed", grpNull, [grpNull]]];

	while {alive leader _followed} do {
		_follow move position leader _followed;
		sleep 60;
	}
};

true