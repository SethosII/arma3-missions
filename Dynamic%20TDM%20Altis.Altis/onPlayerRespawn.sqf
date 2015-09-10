private ["_timeLeft","_minutesLeft","_secondsLeft","_time"];

1000 cutRsc ["FlagNATO", "PLAIN", 1, false];
1001 cutRsc ["TextNATO", "PLAIN", 1, false];
1002 cutRsc ["FlagCSAT", "PLAIN", 1, false];
1003 cutRsc ["TextCSAT", "PLAIN", 1, false];
1004 cutRsc ["FlagAAF", "PLAIN", 1, false];
1005 cutRsc ["TextAAF", "PLAIN", 1, false];
1006 cutRsc ["Timer", "PLAIN", 1, false];
1007 cutRsc ["TextTimer", "PLAIN", 1, false];

while {!end} do {
	_timeLeft = estimatedEndServerTime - serverTime;
	_time = "0:00";
	if (_timeLeft > 0) then {
		_minutesLeft = floor (_timeLeft / 60);
		_secondsLeft = floor _timeLeft mod 60;

		_time = str _minutesLeft + ":";
		if (_secondsLeft < 10) then {
			_time = _time +  "0" + str _secondsLeft;
		} else {
			_time = _time + str _secondsLeft;
		};
	};

	(TextNATO displayCtrl 1001) ctrlSetText str scoreSide west;
	(TextCSAT displayCtrl 1003) ctrlSetText str scoreSide east;
	(TextAAF displayCtrl 1005) ctrlSetText str scoreSide independent;
	(TextTimer displayCtrl 1007) ctrlSetText _time;

	sleep 1;
};

true