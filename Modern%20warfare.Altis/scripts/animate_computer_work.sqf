/*
 * Author: SethosII
 * 
 * Purpose:
 * animate given unit with "sitting at table" animation with random delay
 *
 * Parameter:
 * _this select 0: unit for animation
 *
 * Returns:
 * true when completed
 *
 * Example:
 * _animate_computer_work_sqf = [this] execVM "scripts\animate_computer_work.sqf";
 */

if (isServer) then {
	[_this, 0, objNull, [objNull]] call BIS_fnc_param;

	private ["_unit"];

	_unit = _this select 0;

	while {true} do {
		// choose an animation
		switch (floor random 3) do {
			case 0: {
				[ [ [_unit] , { (_this select 0) switchMove "HubSittingAtTableU_idle1" } ], "BIS_fnc_spawn", true, false, false ] spawn BIS_fnc_MP;
				sleep (13.495 + random 20);
			};
			case 1: {
				[ [ [_unit] , { (_this select 0) switchMove "HubSittingAtTableU_idle2" } ], "BIS_fnc_spawn", true, false, false ] spawn BIS_fnc_MP;
				sleep (11.337 + random 20);
			};
			case 2: {
				[ [ [_unit] , { (_this select 0) switchMove "HubSittingAtTableU_idle3" } ], "BIS_fnc_spawn", true, false, false ] spawn BIS_fnc_MP;
				sleep (20.491 + random 10);
			};
		};
		sleep random 5;
	};
};

true