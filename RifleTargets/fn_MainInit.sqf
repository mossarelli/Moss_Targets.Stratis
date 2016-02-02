/*
	Author: Mossarelli

	Description:
	PreInits variables that the other functions needs.
*/

//Prevent falling targets from popping up
nopop = true;

//Assign the initial variables to player.
player setVariable ["MossShooterScoreInfo",[player],false];
player setVariable ["MossPlayerLogicName","",false];
player setVariable ["MossShooterCamera","",false];

//If you want to use a custom target texture for the falling targets, uncomment the line below:
MOSS_CustomFallingTargetTexture = "pics\Range\FT_1.jpg";

MOSS_TargetMarkers = true; //Enable the Orange markers on the target.
MOSS_TargetMarkerAliveTime = 5; //How long will the orange marker be shown.

MOSS_RifleOnTable = "arifle_MX_f"; //The rifle to put on the table.
MOSS_Magazine = "30Rnd_65x39_caseless_mag"; //The magazine to put in the box.
MOSS_Box = "Box_NATO_Ammo_F"; //The magazine to put in the box.

MOSS_PistolOnTable = "hgun_Pistol_heavy_01_F"; //The pistol to put on the table.
MOSS_PMagazine = "11Rnd_45ACP_Mag"; //The magazines to put in the box.

//These two must be two different objects.
MOSS_TargetObject = "SignAd_Sponsor_ARMEX_F"; //Type of Object for the target. Important for the init of the logic.
MOSS_MonitorObject = "SignAd_Sponsor_ION_F"; //Type of Object for the Camera Monitor. Important for the init of the logic.

//For falling targets
MOSS_FallingTargetObject = //Type of Object for the target. Important for the init of the logic.
[
	"TargetP_Inf_F",
	"TargetP_Inf_Acc2_F",
	"TargetP_Inf_Acc1_F",
	"TargetP_Inf2_F",
	"TargetP_Inf2_Acc2_F",
	"TargetP_Inf2_Acc1_F",
	"TargetP_Inf3_F",
	"TargetP_Inf3_Acc2_F",
	"TargetP_Inf3_Acc1_F",
	"TargetP_Inf4_F",
	"TargetP_Inf4_Acc2_F",
	"TargetP_Inf4_Acc1_F",
	"TargetP_HVT1_F",
	"TargetP_HVT2_F"
]; 

MOSS_FallingPlateTargetObject = //Type of Object for the target. Important for the init of the logic.
[
	"Steel_Plate_L_Stand_F",
	"Steel_Plate_S_Stand_F",
	"Steel_Plate_Stand_F"
]; 

Moss_ListOfLanes =
[
	//[Name of Logic, "Name of Range"],
	[Logic_Lane,"TEMPLATE LANE! COPY PASTE ME FOR FAST NUMBER NAMING BUT PLEASE DONT USE ME."],
	[Logic_Lane_01,"Lane 1"],
	[Logic_Lane_02,"Lane 2"],
	[Logic_Lane_03,"Lane 3"],
	[Logic_Lane_04,"Lane 4"],
	[Logic_Lane_05,"Lane 5"],
	[Logic_Lane_06,"Lane 6"],
	[Logic_Lane_07,"Lane 7"],
	[Logic_Lane_08,"Lane 8"],
	[Logic_Lane_09,"Lane 9"],
	[Logic_Lane_10,"Lane 10"],
	[Logic_Lane_11,"Lane 11"],
	[Logic_Lane_12,"Lane 12"],
	[Logic_Lane_13,"Lane 13"],
	[Logic_Lane_14,"Lane 14"],
	[Logic_Lane_15,"Lane 15"],
	[Logic_Lane_16,"Lane 16"],
	[Logic_Lane_17,"Lane 17"],
	[Logic_Lane_18,"Lane 18"],
	[Logic_Lane_19,"Lane 19"],
	[Logic_Lane_20,"Lane 20"]
];

MOSS_SignObject = "Land_InfoStand_V2_F"; //Type of Object for the sign. Important for the init of the logic.
MOSS_NumberSignObject = "UserTexture1m_F"; //Type of Object for the Number Sign. Important for the init of the logic.
MOSS_TableObject = "Land_CampingTable_small_F"; //Type of Object for the sign. Important for the init of the logic.

MOSS_TargetHeighOffset = 81; //Because center of the signs height is not center of the paper target's center, an offset must be used.

MOSS_ShowAverages = true; //Show the average score in the score message.

//Debug variable to get information from the scripts
MOSS_DEBUG = true;