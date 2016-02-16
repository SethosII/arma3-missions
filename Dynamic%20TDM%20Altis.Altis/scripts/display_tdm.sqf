/*
 * Author: SethosII
 * 
 * Purpose:
 * display current score of each side and remaining time if not unlimited and update every second
 * stopwatch icon will become orange on less then one minute remaining and red on less then 10 seconds
 * needs variable end to be set
 *
 * Parameter:
 * _this select 0: maximum game time, 0 means unlimited and no timer is displayed
 *
 * Returns:
 * true when completed
 *
 * Example:
 * _display_tdm_sqf = [600] execVM "scripts\display_tdm.sqf";
 */

 
params [["_maxGameTime", 0, [0]]];

private ["_timeLeft","_minutesLeft","_secondsLeft","_time"];

1000 cutRsc ["FlagNATO", "PLAIN", 1, false];
1001 cutRsc ["TextNATO", "PLAIN", 1, false];
1002 cutRsc ["FlagCSAT", "PLAIN", 1, false];
1003 cutRsc ["TextCSAT", "PLAIN", 1, false];
1004 cutRsc ["FlagAAF", "PLAIN", 1, false];
1005 cutRsc ["TextAAF", "PLAIN", 1, false];
if (_maxGameTime != 0) then {
	1006 cutRsc ["Timer", "PLAIN", 1, false];
	1007 cutRsc ["TextTimer", "PLAIN", 1, false];
};

while {!end} do {
	// update time
	if (_maxGameTime != 0) then {
		_timeLeft = estimatedEndServerTime - serverTime;
		_time = "0:00";
		if (_timeLeft > 0) then {
			_minutesLeft = floor (_timeLeft / 60);
			_secondsLeft = floor _timeLeft mod 60;

			// set text colour
			if (_minutesLeft == 0) then {
				if (_secondsLeft < 10) then {
					// less then ten seconds
					(uiNamespace getVariable "Timer" displayCtrl 1006) ctrlSetTextColor [0.8, 0, 0, 1]; // red
				} else {
					// less then one minute
					(uiNamespace getVariable "Timer" displayCtrl 1006) ctrlSetTextColor [0.8, 0.4, 0, 1]; // orange
				};
			} else{
				// more then one minute
				(uiNamespace getVariable "Timer" displayCtrl 1006) ctrlSetTextColor [0.3, 0.3, 0.3, 1]; // grey
			};

			// set text
			_time = str _minutesLeft + ":";
			if (_secondsLeft < 10) then {
				_time = _time +  "0" + str _secondsLeft;
			} else {
				_time = _time + str _secondsLeft;
			};
		};
		(uiNamespace getVariable "TextTimer" displayCtrl 1007) ctrlSetText _time;
	};

	// update score
	(uiNamespace getVariable "TextNATO" displayCtrl 1001) ctrlSetText str scoreSide west;
	(uiNamespace getVariable "TextCSAT" displayCtrl 1003) ctrlSetText str scoreSide east;
	(uiNamespace getVariable "TextAAF" displayCtrl 1005) ctrlSetText str scoreSide independent;

	sleep 1;
};

true
