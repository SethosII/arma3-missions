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
	[_this, 0, objNull, [objNull]] call BIS_fnc_param;
	[_this, 1, grpNull, [grpNull]] call BIS_fnc_param;
	[_this, 2, objNull, [objNull]] call BIS_fnc_param;
	[_this, 3, objNull, [objNull]] call BIS_fnc_param;

	private ["_hostage", "_rescue", "_trigger", "_guard", "_rescued"];

	_hostage = _this select 0;
	_rescue = _this select 1;
	_trigger = _this select 2;
	_guard = _this select 3;

	_hostage setCaptive true;
	_hostage disableAI "MOVE";
	removeAllWeapons _hostage;

	_nul = [_hostage, _guard, _trigger] spawn {
		// shoot the hostage when trigger is activated
		waitUntil{triggerActivated (_this select 2)};

		_this select 0 setCaptive false;
		_this select 1 doWatch (_this select 0);
		_this select 1 doTarget (_this select 0);
		_this select 1 doFire (_this select 0);
	};
	
	waitUntil{
		sleep 1;
		_rescued = false;
		{
			if (_x distance _hostage < 2) then {
				_rescued = true;
			};
		} forEach units _rescue;
		_rescued
	};
	[_hostage] join _rescue;
	_hostage enableAI "MOVE";
};

true