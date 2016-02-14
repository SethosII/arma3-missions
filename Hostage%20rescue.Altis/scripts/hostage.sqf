/*
 * Author: SethosII
 * 
 * Purpose:
 * set a unit as hostage, kill the hostage by a guard when trigger condition is met and free and join the hostage by a rescue group
 *
 * Parameter:
 * _this select 0: hostage
 * _this select 1: rescue group
 * _this select 2: condition for hostage to not be captive anymore, if true the hostage is killed by the guard
 * _this select 3: guard, will kill the hostage when condition gets true
 *
 * Returns:
 * true when completed
 *
 * Example:
 * _hostage_sqf = [hostage, players, detected, guard] execVM "scripts\hostage.sqf";
 */

if (isServer) then {
	params [["_hostage", objNull, [objNull]],
		["_rescue", grpNull, [grpNull]],
		["_trigger", objNull, [objNull]],
		["_guard", objNull, [objNull]]];

	_hostage setCaptive true;
	_hostage disableAI "MOVE";
	removeAllWeapons _hostage;
	[[_hostage], {(_this select 0) switchMove "Acts_AidlPsitMstpSsurWnonDnon_loop"}] remoteExec ["BIS_fnc_spawn"];

	// shoot the hostage when trigger is activated
	_nul = [_hostage, _guard, _trigger] spawn {
		params [["_hostage", objNull, [objNull]],
			["_guard", objNull, [objNull]],
			["_trigger", objNull, [objNull]]];
		waitUntil {triggerActivated _trigger};

		_hostage setCaptive false;
		_guard doWatch _hostage;
		_guard doTarget _hostage;
		_guard doFire _hostage;
	};

	// add action to free the hostage and join it to the group of the saviour
	[[_hostage], {
		(_this select 0) addAction ["Free", {
			params [["_hostage", objNull, [objNull]],
				["_caller", objNull, [objNull]],
				["_action", 0, [0]]];
			[[_hostage, _action], {(_this select 0) removeAction (_this select 1);}] remoteExec ["BIS_fnc_spawn"];
			[_hostage] join group _caller;
			_hostage setCaptive false;
			_hostage enableAI "MOVE";
			[[_hostage], {(_this select 0) switchMove "Acts_AidlPsitMstpSsurWnonDnon_out"}] remoteExec ["BIS_fnc_spawn"];
		}];
	}] remoteExec ["BIS_fnc_spawn"];
};

true