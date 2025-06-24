// Exemplo de uso:
// _aviso = "Mensagem";
// nul = [(_aviso)] execVM "hintGlobal.sqf";

_msg = _this select 0;

avisoMsg = _msg;
publicVariable "avisoMsg";

avisos = true;
publicVariable "avisos";

sleep 1;

avisos = false;
publicVariable "avisos";