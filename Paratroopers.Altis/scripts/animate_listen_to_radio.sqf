/*
 * Author: SethosII
 * 
 * Purpose:
 * animate given unit with "listen to headset" animation with random delay
 *
 * Parameter:
 * _this select 0: unit for animation
 *
 * Returns:
 * true when completed
 *
 * Example:
 * _animate_listen_to_radio_sqf = [this] execVM "scripts\animate_listen_to_radio.sqf";
 */

if (isServer) then {
	[_this, 0, objNull, [objNull]] call BIS_fnc_param;

	private ["_unit"];

	_unit = _this select 0;

	while {true} do {
		sleep random 60;
		[ [ [_unit] , { (_this select 0) switchMove "Acts_listeningToRadio_in" } ], "BIS_fnc_spawn", true, false, false ] spawn BIS_fnc_MP;
		sleep 0.834;
		[ [ [_unit] , { (_this select 0) switchMove "Acts_listeningToRadio_loop" } ], "BIS_fnc_spawn", true, false, false ] spawn BIS_fnc_MP;
		sleep 6.165;
		[ [ [_unit] , { (_this select 0) switchMove "Acts_listeningToRadio_out" } ], "BIS_fnc_spawn", true, false, false ] spawn BIS_fnc_MP;
		sleep 1.166;
	};
};

true