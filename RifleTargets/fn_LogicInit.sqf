/*
	Author: Mossarelli

	Description:
	Function called by the logic to initialize the whole lane.

	Parameter(s):
		0:	Logic Object.

	Returns:
	N/A
*/

_object = _this select 0;
_targettype = _this select 1;

//Error Message.
if (isNull _object) exitWith
{
	[
		"Error: There's no Logic referred in the script. Make sure there's one Logic per firing lane."
	] call BIS_fnc_errorMsg;
};

//Init the Array for the targets. For each target synced to the logic, they will be added to this variable.
_object setVariable ["MossLogicTargetArray",[],true];

//Get the objects that are synced to the logic.
_synced_objects = synchronizedObjects _object;

//Error Message.
if (count (_synced_objects) < 2) exitWith
{
	[
		"Error: Make sure to sync all signs and targets to the logic in the editor."
	] call BIS_fnc_errorMsg;
};

//Use Target's lane number to make a unique variable for the texture.
_logicname = ([( str _object),11,12] call BIS_fnc_trimString);

//Make unique variable.
_texturename = format ["pics\Range\%1.jpg",_logicname];

_target = 0;
_FallingTargets = 0;
_PlateTargets = 0;
_sign = "";
_table = "";
_box = "";

//Init all the objects.
{
	_localx = _x;
	if (_x isKindOf MOSS_TargetObject) then
	{
		_target = _x;
	};
	
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
	
	if (_x isKindOf MOSS_SignObject) then
	{
		_sign = _x;
		_sign setObjectTexture [0,_texturename];
	};
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
} foreach _synced_objects;

if (typeName _target != "SCALAR") then
{
	//[_target,_object] call Moss_fnc_TargetInit;
	//[_sign,_object] call Moss_fnc_TargetSignInit;
	//[_table,"rifle"] call Moss_fnc_WeaponOnTable;
	//_box addMagazineCargo [MOSS_Magazine,30];
};

if (typeName _FallingTargets != "SCALAR") then
{
	{
		[_x,_object] call Moss_fnc_FallingTargetInit;
	} foreach _FallingTargets;
	[_sign,_object] call Moss_fnc_FallingSignInit;
	[_table,"pistol"] call Moss_fnc_WeaponOnTable;
	_box addMagazineCargo [MOSS_PMagazine,30];
};

if (typeName _PlateTargets != "SCALAR") then
{
	{
		[_x,_object] call Moss_fnc_FallingTargetInit;
	} foreach _PlateTargets;
	[_sign,_object] call Moss_fnc_FallingSignInit;
	[_table,"pistol"] call Moss_fnc_WeaponOnTable;
	_box addMagazineCargo [MOSS_PMagazine,30];
};

/*

*/