
// ARMA3.RU Mission Template
enableSaving [false, false];
0 = execVM "add_med.sqf";
setTerrainGrid 1;

//Лок формы
if (!isDedicated) then {	

	waitUntil {!(isNull player)};
	player addEventHandler ["inventoryOpened","_nul=execVM 'script.sqf'"];
};

tu_decoration_disable_vehicle_logo = false;

// Init modules
#include "a3a_modules.hpp"
{
	[] execVM "A3A_MODULES\" + _x + "\init.sqf";
} forEach A3A_MODULES;

if (playerside == west) then {
private ["_vip"];
laptopHack = false; publicVariable "laptopHack";

[    
    vip,
    "Опознать тело",
    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
    "(_this distance _target < 2) && (!alive vip)",
    "(_this distance _target < 2) && (alive _this)",
    {cutText ["Идет опознание. . .","PLAIN",2];},
    {},
    {cutText ["Личность подтверждена!!!","PLAIN",2]; laptopHack = true; publicVariable "laptopHack";},
    {},
    [],
    30,
    nil,
    true,
    false
] call BIS_fnc_holdActionAdd;
};

if (isServer) then {
[] spawn {
waitUntil { sleep 10; a3a_var_started };
_vll2 = 0;
while {isNil "srv_triggerFinished"} do { 
        sleep 3;
        if (_vll2 == 0) then {
            if (laptopHack) then {
                _vll2 = 1; 
            };
        };
        if (_vll2 == 1) then {    
        srv_triggerFinished = true;
        ["Лидер ЧДКЗ ликвидирован, победа атаки!", WEST] call a3a_fnc_endMission;
		["Лидер ЧДКЗ ликвидирован, победа атаки!", WEST] call BIS_fnc_endMission;
        };
    };
};
};
