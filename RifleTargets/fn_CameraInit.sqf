/*
	Author: Mossarelli

	Description:
	Function called by the object that renders the camera on the target.

	Parameter(s):
		0:	Target Object.
		1:	Logic Object.
	
	Usage:
	0 = [this,Logic_Name] call Moss_fnc_CameraInit;
*/

private ["_object","_logic","_LogicTargetArray"];
_object = [(_this select 3), 0, objNull, [objNull]] call BIS_fnc_param;
_logic = [(_this select 3), 1, objNull, [objNull]] call BIS_fnc_param;

//Check if camera already exists:
_cam = _logic getVariable "MossTargetCameraName";
//Destroy existing camera:

if (!isNull (_logic getVariable "MossTargetCameraName")) then
{
	_cam cameraEffect ["terminate","back"];
	camDestroy _cam;
	_object setObjectTexture [0,""];
	_logic setVariable ["MossTargetCameraName",nil,true];
};

_object allowDamage false;

_LogicTargetArray = _logic GetVariable "MossLogicTargetArray";

_whilevariable = true;

while { _whilevariable } do
{
	//Make sure target is an object.
	if ((typeName _LogicTargetArray) == "OBJECT") then
	{
		_whilevariable = false;
	};
};

//Return Logic's target array. Turn this on in MainInit.
if (MOSS_DEBUG) then
{
	systemChat format ["%1",_LogicTargetArray select 0];
};

//Get target object.
_target = _LogicTargetArray select 0;

//Use Target's lane number to make a unique variable for the camera.
_targetstring = str ([( str _target),2] call BIS_fnc_trimString);

//Get the number of the unique camera name variable.
//hint format ["%1",_targetstring];

//Make unique variable.
_rtt = format ["rendertarget%1",_targetstring];

//Create camera.
_cam = "camera" camCreate (_target modelToWorld [0,-1.5,0.8]);
_cam camPrepareFov 0.450;
_cam camPrepareTarget (_target modelToWorld [0,0,0.8]);
_cam camCommitPrepared 0;
_cam cameraEffect ["INTERNAL", "BACK", _rtt];

//Assign texture to sign.
_object setObjectTexture [0, (format ["#(argb,256,256,1)r2t(%1,1.0)",_rtt])];  

_logic setVariable ["MossTargetCameraName",_cam,true];