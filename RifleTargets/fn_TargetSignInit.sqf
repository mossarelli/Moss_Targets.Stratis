/*
	Author: Mossarelli

	Description:
	Function called by the sign with the action that registers the shooter with name and score variable.

	Parameter(s):
		0:	Sign or Object that should get the addActions
		1:	Name of Logic associated with Lane.

	Returns:
	N/A
*/

private ["_object","_logicname"];
_object = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_logicname = [_this, 1, objNull, [objNull]] call BIS_fnc_param;

_object allowDamage false;
_object enableSimulation false;

//Get the Range name string.
[_logicname] call Moss_fnc_GetRangeName;

//Add Actions to sign.
_object addAction [("<t color=""#FFFF66"">" + ("Register Rifleman") + "</t>"),Moss_fnc_RegisterShooter,_logicname];
_object addAction [("<t color=""#FFFF66"">" + ("Show Score") + "</t>"),Moss_fnc_ShowScore,_logicname];
_object addAction [("<t color=""#FFFF66"">" + ("Reset my Score") + "</t>"),Moss_fnc_ResetScore,_logicname];
_object addAction [("<t color=""#FFFF66"">" + ("Unregister rifleman") + "</t>"),Moss_fnc_UnregisterShooter,_logicname];