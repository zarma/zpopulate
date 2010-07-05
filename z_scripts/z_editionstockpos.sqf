/*//////////////////////////////////////////////////////////////////
 Function file for Armed Assault 2
 Created by: =[A*C]= Z
 Add this in init.sqf 
	z_nbocc = 0;
	z_posarray = [];
	
	player addAction ["stock position","z_scripts\z_editionstockpos.sqf"];
	
	
	TODO setCombatMode
	 		Test generated code

/////////////////////////////////////////////////////////////////*/
private ["_T","_textC","_text"];
_param = _this select 3;
_format = _param select 0;
hint format["%1",_param];

if (_format=="TEXT") then {

	_T = ["<NEWUNIT>"];
	_str = format["'%4' createUnit [z_posSpawnEni,_grp] ;_unit%1 setPosASL %2;_unit%1 setDir %3;",z_nbocc,getPosASL player,getDir player,typeof player];
	_T = _T + [ _str + "<BR>"];
	_str = format["removeAllWeapons _unit%1;{_unit%1 addWeapon _x;} forEach %2;",z_nbocc,weapons player];
	_T = _T + [ _str + "<BR>"];
	_str = format["{_unit%1 addMagazine _x;} forEach %2;",z_nbocc,magazines player];
	_T = _T + [ _str + "<BR>"];
};
if (_format=="XML") then {
	
	_str = "<type>"+z_unittype+"</type>"+"<number>"+format["%1",z_nbocc]+"</number>";
//		_str = _str + "<setPosASL>"+format["%1",getPosASL player]+"</setPosASL>";
	_str = _str + "<setPosASL>"+format["%1",getPosASL player]+"</setPosASL>";
	_str = _str + "<setDir>"+format["%1",getDir player]+"</setDir>";
	_str = _str + "<addWeapon>"+format["%1",weapons player]+"</addWeapon>";
	_str = _str + "<addMagazine>"+format["%1",magazines player]+"</addMagazine>";
//	_str = _str + "<BR>";
	_T = ["<createUnit>"+_str+"</createUnit>"];
	hint format["_T %1",_T];
};
z_nbocc=z_nbocc+1;
sleep 1;
z_posarray = z_posarray  + _T;
_text = format ["%1",z_posarray];
hint _test;
_textC = "";
{
	_textC = _textC + _x;
	} forEach z_posarray;
copyToClipboard _textC;
