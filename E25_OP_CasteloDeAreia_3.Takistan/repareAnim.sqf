if(isServer) then {
	while {alive c1 || alive c2 || alive us1 || alive us2} do {
		if(alive c1) then{
			c1 switchMove "RepairingKneel";
			sleep 1;
		}
		else{
			c1 switchMove "";
		};
		if(alive c2) then{
			c2 switchMove "RepairingKneel";
			sleep 3;
		}
		else{
			c2 switchMove "";
		};
		if(alive us1) then{
			us1 switchMove "RepairingKneel";
			sleep 1;
		}
		else{
			us1 switchMove "";
		};
		if(alive us2) then{
			us2 switchMove "RepairingKneel";
		}
		else{
			us2 switchMove "";
		};

		sleep 90;
	};
};

//_unit switchMove "aidlpknlmstpslowwrfldnon_idlesteady02"; // Para a movimentação