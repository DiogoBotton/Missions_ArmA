sleep 44;

enableCamShake true;
addCamShake [10, 2, 25];

sleep 5;

for [{_i=1}, {_i <= 9}, {_i=_I+1}] do {
	enableCamShake true;
	addCamShake [5, 5, 25];
	sleep 4;
};