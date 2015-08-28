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
	params [["_unit", objNull, [objNull]]];

	while {true} do {
		sleep random 60;
		[[_unit], {(_this select 0) switchMove "Acts_listeningToRadio_in"}] remoteExec ["BIS_fnc_spawn"];
		sleep 0.834;
		[[_unit], {(_this select 0) switchMove "Acts_listeningToRadio_loop"}] remoteExec ["BIS_fnc_spawn"];
		sleep 6.165;
		[[_unit], {(_this select 0) switchMove "Acts_listeningToRadio_out"}] remoteExec ["BIS_fnc_spawn"];
		sleep 1.166;
	};
};

true