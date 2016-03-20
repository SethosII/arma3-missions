/*
 * Author: SethosII
 * 
 * Purpose:
 * animate given units to do a dispute
 *
 * Parameter:
 * _this select 0: unit for animation
 * _this select 1: should unit move a bit around
 *
 * Returns:
 * true when completed
 *
 * Example:
 * _animate_dispute_sqf = [this, true] execVM "scripts\animate_dispute.sqf";
 */

if (isServer) then {
	params [["_unit", objNull, [objNull]],
		["_moves", true, [true]]];

	while {true} do {
		if (_moves) then {
			[[_unit], {(_this select 0) switchMove "Acts_B_out2_briefing"}] remoteExec ["BIS_fnc_spawn"];
			sleep 92.359;
		} else {
			[[_unit], {(_this select 0) switchMove "Acts_StandingSpeakingUnarmed"}] remoteExec ["BIS_fnc_spawn"];
			sleep 71.942;
		};
	};
};

true
