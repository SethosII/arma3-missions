sleep 10;
diag_log "!!!START!!!";
for "_i" from 30720 to 0 step -50 do {
	for "_j" from 0 to 30720 step 50 do {
		laptop setPosATL [_j,_i,0];
		diag_log ((getPosASL laptop) select 2);
	};
	hint format ["%1", _i];
};
diag_log "!!!ENDE!!!";