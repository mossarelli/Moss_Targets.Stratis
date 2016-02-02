/*
	Author: Mossarelli

	Description:
	Function to get the name of the range from the array in the file RangeNamesConfig.txt

	Parameter(s):
	Uses Logic names as objects to store the variable on.
	
	Returns:
	N/A
*/

_logic = [_this, 0, objNull, [objNull]] call BIS_fnc_param;

_return = "";

#include "RangeNamesConfig.txt"

{
	if (_logic == (_x select 0)) exitWith
	{
		_logic setVariable ["MossRangeNumber",(_x select 1),true];
		_return = (_x select 1)
	};
} foreach Moss_ListOfLanes;

_return
