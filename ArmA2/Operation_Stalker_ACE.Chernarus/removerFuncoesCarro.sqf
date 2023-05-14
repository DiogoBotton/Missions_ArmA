for "_i" from 0 to 10 do {
	suv1 setFuel 0;
	suv2 setFuel 0;
	suv3 setFuel 0;
	logic_light_suvs action ["LightOff", suv1];
	logic_light_suvs action ["LightOff", suv2];
	logic_light_suvs action ["LightOff", suv3];
	sleep 20;
};