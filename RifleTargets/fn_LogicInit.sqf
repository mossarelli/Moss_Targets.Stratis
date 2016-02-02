/*
	Author: Mossarelli

	Description:
	Function called by the logic to initialize the whole lane.

	Parameter(s):
		0:	Logic Object.

	Returns:
	N/A
	
	Usage:
	Put the following line of code in the init of the logic object in the editor:
	0 = [this] call Moss_fnc_LogicInit;
*/

_logicname = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_parameter = [_this, 1, "", [""]] call BIS_fnc_param;

//Error Message.
if (isNull _logicname) exitWith
{
	[
		"Error: There's no Logic referred in the script. Make sure there's one Logic per firing lane."
	] call BIS_fnc_errorMsg;
};

call compile format ['
	[{ systemChat "LOGIC: %1"; }, "BIS_fnc_Spawn", true, false, false] call BIS_fnc_MP;
	',_LogicName
];
if true exitWith {};

//Init the Array for the targets. For each target synced to the logic, they will be added to this variable.
_logicname setVariable ["MossLogicTargetArray",[],true];

//Get the objects that are synced to the logic.
_synced_objects_logic = synchronizedObjects _logicname;

//Error Message.
if (count (_synced_objects_logic) < 2) exitWith
{
	[
		"Error: Make sure to sync all signs and targets to the logic in the editor."
	] call BIS_fnc_errorMsg;
};

//Use Target's lane number to make a unique variable for the texture.
_logicname = ([( str _logicname),11,12] call BIS_fnc_trimString);

//Make unique variable.
_texturename = format ["pics\Range\%1.jpg",_logicname];

_target = 0;
_FallingTargets = 0;
_PlateTargets = 0;
_sign = "";
_table = "";
_box = "";
_monitor = "";

//Init all the objects.
{
	//Variable for nested foreach loops:
	_localx = _x;
	
	//Check if the target is the same as in the list:
	if (_x isKindOf MOSS_TargetObject) then
	{
		_target = _x;
	};
	
	//Check if target is of fallingtarget type:
	{
		if (_localx isKindOf _x) then
		{
			if (typeName _FallingTargets == "ARRAY") then
			{
				_FallingTargets set [count _FallingTargets, _localx];
			};
			if (typeName _FallingTargets == "SCALAR") then
			{
				_FallingTargets = [_localx];
			};
		};
	} foreach MOSS_FallingTargetObject;
	
	{
		if (_localx isKindOf _x) then
		{
			if (typeName _PlateTargets == "ARRAY") then
			{
				_PlateTargets set [count _PlateTargets, _localx];
			};
			if (typeName _PlateTargets == "SCALAR") then
			{
				_PlateTargets = [_localx];
			};
		};
	} foreach MOSS_FallingPlateTargetObject;
	
	//Check if object is a sign:
	if (_x isKindOf MOSS_SignObject) then
	{
		_sign = _x;
		_sign setObjectTexture [0,_texturename];
	};
	
	//Check if object is a table:
	if (_x isKindOf MOSS_TableObject) then
	{
		_table = _x;
	};
	
	if (_x isKindOf MOSS_Box) then
	{
		_box = _x;
		clearItemCargo _box;
		clearMagazineCargo _box;
		clearWeaponCargo _box;
	};
	if (_x isKindOf MOSS_NumberSignObject) then
	{
		_x setObjectTexture [0,_texturename];
	};
	if (_x isKindOf MOSS_MonitorObject) then
	{
		_monitor = _x;
	};
} foreach _synced_objects_logic;

if (typeName _target != "SCALAR") then
{
	[_target,_logicname] call Moss_fnc_TargetInit;
	[_sign,_logicname] call Moss_fnc_TargetSignInit;
	[_table,"rifle"] call Moss_fnc_WeaponOnTable;
	_box addMagazineCargo [MOSS_Magazine,30];
	[_monitor,_logicname] call Moss_fnc_CameraInit;
};

if (typeName _FallingTargets != "SCALAR") then
{
	{
		[_x,_logicname] call Moss_fnc_FallingTargetInit;
	} foreach _FallingTargets;
	[_sign,_logicname] call Moss_fnc_FallingSignInit;
	[_table,"pistol"] call Moss_fnc_WeaponOnTable;
	_box addMagazineCargo [MOSS_PMagazine,30];
};

if (typeName _PlateTargets != "SCALAR") then
{
	{
		[_x,_logicname] call Moss_fnc_FallingTargetInit;
	} foreach _PlateTargets;
	[_sign,_logicname] call Moss_fnc_FallingSignInit;
	[_table,"pistol"] call Moss_fnc_WeaponOnTable;
	_box addMagazineCargo [MOSS_PMagazine,30];
};

/*

*/