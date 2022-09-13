//Vars
westDeaths = 0; 
publicVariable "westDeaths";

#define vclCrewClass		"TK_INS_Soldier_AT_EP1"
#define staticClass			"TK_INS_Soldier_3_EP1"
#define eastVehiclesFreq	["Offroad_DSHKM_Gue","Offroad_DSHKM_Gue","Ka137_MG_PMC","Ka137_MG_PMC","BMP2_TK_EP1","BMP2_TK_EP1","LandRover_MG_TK_INS_EP1","LandRover_MG_TK_INS_EP1","LandRover_SPG9_TK_INS_EP1","LandRover_SPG9_TK_INS_EP1"]
//#define eastVehiclesFreq	["BRDM2_TK_EP1","BRDM2_TK_EP1","M113_TK_EP1","M113_TK_EP1","Mi24_D_TK_EP1","Mi24_D_TK_EP1","UH1H_TK_EP1","UH1H_TK_EP1","BTR60_TK_EP1","BTR60_TK_EP1","LandRover_MG_TK_INS_EP1","LandRover_MG_TK_INS_EP1","LandRover_MG_TK_INS_EP1","LandRover_SPG9_TK_INS_EP1","LandRover_SPG9_TK_INS_EP1","T34_TK_EP1","T55_TK_EP1"]
#define eastLightVehicles	["Offroad_DSHKM_Gue","Ka137_MG_PMC","BMP2_TK_EP1","LandRover_MG_TK_INS_EP1","LandRover_SPG9_TK_INS_EP1"]
#define stationaryGunsHigh 	["KORD_high_UN_EP1","DSHKM_TK_INS_EP1"]
#define stationaryGunsMed	["KORD_high_UN_EP1","DSHKM_TK_INS_EP1"]
#define stationaryGunsLow	["KORD_high_UN_EP1"]
#define eastVclRspnTime		600
#define eastInfCount		(count(CENTERPOS nearObjects [eastInfClasses, AORADIUS]))
#define maxStaticGuns		18

//Markers
#define intelMarkerType		"hd_unknown"

//Misc
#define isEast(X)			(typeOf X in eastInfClasses)
#define isWest(X)			(typeOf X in westSoldierClasses)
