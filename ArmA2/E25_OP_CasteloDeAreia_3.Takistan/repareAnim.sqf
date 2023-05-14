_contagem = 90;

if(isServer) then {
	while {alive _this && !stopAnim} do {
		_sleepRandom = random 2;
		sleep _sleepRandom;

		if(alive _this) then{
			_this switchMove "RepairingKneel";

			while {alive _this && _contagem > 0} do {
				_contagem = _contagem - 1;
				sleep 1;
			};
			_contagem = 90;
		}
		else{
			_this switchMove "";
		};
	};
	_this switchMove "";
};

if(!isServer) then {
	while {alive _this} do {
		sleep 1;
	};

	_this switchMove "";
};

//_unit switchMove "aidlpknlmstpslowwrfldnon_idlesteady02"; // Para a movimentação