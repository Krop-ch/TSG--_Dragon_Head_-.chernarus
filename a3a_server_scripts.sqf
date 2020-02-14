// Серверные скрипты
// Выполняются после инициализации платформы
// Отличное место чтобы разместить какие-нибудь условия победы/поражения в миссии
// Например: waitUntil { sleep 1; a3a_var_started }; ["60 minutes have passed, NATO wins", 3600] spawn a3a_fnc_endMissionTimer;
// Или: waitUntil { sleep 1; a3a_var_started }; [[["marker1", "ZONE 1 NAME", 1, 1], ["marker2", "ZONE 2 NAME", 1, 1]], 0, true, "UNKNOWN"] spawn a3a_fnc_endMissionZonesCapture;


[] spawn {
waitUntil { sleep 10; a3a_var_started };
_vll2 = 0;
while {isNil "srv_triggerFinished"} do { 
        sleep 3;
        if (laptopHack) then {    
			srv_triggerFinished = true;
			["Лидер ЧДКЗ ликвидирован, победа атаки!", WEST] call a3a_fnc_endMission;
        };
    };
};