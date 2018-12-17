/*
    KPLIB_fnc_permission_changePermission

    File: fn_permission_changePermission.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-12-16
    Last Update: 2018-12-17
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Changes the selected permission of the given player.

    Parameter(s):
        _args - Provided arguments of the EH [ARRAY, defaults to []]]

    Returns:
        Function reached the end [BOOL]
*/

params [
    ["_args", [], [[]]]
];

_args params ["_control"];

// Dialog controls
private _dialog = findDisplay 758011;
private _ctrlPlayerList = _dialog displayCtrl 68740;

// Colors
private _red = [0.9,0,0,1];
private _green = [0,0.8,0,1];
private _white = [1,1,1,1];

// Read the control
private _permission = false;

private _data = _control getVariable ["Data", ["", false]];
private _index = lbCurSel _ctrlPlayerList;
private _player = _ctrlPlayerList lbData _index;

true
