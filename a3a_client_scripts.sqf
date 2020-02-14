// Клиентские скрпты, выполняются после инициализации платформы
if (!isDedicated) then {	

	waitUntil {!(isNull player)};
	player addEventHandler ["inventoryOpened","_nul=execVM 'script.sqf'"];
};
if (playerside == west) then {

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