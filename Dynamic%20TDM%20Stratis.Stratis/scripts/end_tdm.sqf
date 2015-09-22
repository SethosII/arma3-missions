/*
 * Author: SethosII
 * 
 * Purpose:
 * set maximum time and score and end the scenario if one is reached and display the result
 * sets end to false at start and to true when conditions are met
 *
 * Parameter:
 * _this select 0: end game after time is expired, 0 means unlimited
 * _this select 1: end game when a side reaches this score, 0 means unlimited
 *
 * Returns:
 * true when completed
 *
 * Example:
 * _end_tdm_sqf = [600, 20] execVM "scripts\end_tdm.sqf";
 */

 
params [["_maxGameTime", 0, [0]],
	["_maxSideScore", 0, [0]]];

private ["_scores","_message","_winner"];

// set end time
if(isServer && _maxGameTime != 0) then {
	estimatedTimeLeft _maxGameTime;
};

// scenario ending
end = false;

sleep 5; // dirty fix for mission ending on start because estimatedEndServerTime is not set yet

waitUntil {_maxSideScore != 0 && (scoreSide west >= _maxSideScore || scoreSide east >= _maxSideScore || scoreSide independent >= _maxSideScore) || _maxGameTime != 0 && serverTime > estimatedEndServerTime};

_scores = [[scoreSide west,west],[scoreSide east,east],[scoreSide independent, independent]];
_scores sort false;
_scores = _scores; // scores is otherwise undefined after sorting
_message = format ["%1 wins with %2 points!", _scores select 0 select 1, _scores select 0 select 0];
_winner = _scores select 0 select 1;
if (_scores select 0 select 0 == _scores select 1 select 0) then {
	_message = "Tie!";
	_winner = civilian;
};

hint format["%1\n\n1. %2: %3\n2. %4: %5\n3. %6 %7", _message, _scores select 0 select 1, _scores select 0 select 0, _scores select 1 select 1, _scores select 1 select 0, _scores select 2 select 1, _scores select 2 select 0];
end = true;
sleep 5;
if (side player == _winner) then {
	"END1" call BIS_fnc_endMission;
} else {
	["LOSE",false] call BIS_fnc_endMission;
};

true