//////////////////////////////////////////////////////////////////
// Function file for Armed Assault 2
// Created by: =[A*C]= Z
//  called by 
// 
// TODO :
//  Testing
//
//
//
//
//
//////////////////////////////////////////////////////////////////

#include "z_def.hpp"
private ["_vehicle"];
disableSerialization; // A cause des displayCtrl

//format["Z_MENLIST %1  ", Z_MENLIST] call z_smsg;

Z_SELECTED=false;
ZCURLIST = [];

createDialog "Z_Dialog";
sleep 1;
_dlg = findDisplay DLG_Z_IDD;

_ctrlList = _dlg displayCtrl DLG_Z_LIST;

_index = 0;
{
  lbAdd [DLG_Z_FACTION_COMBO,format["%1",_x]];
  lbSetValue [DLG_Z_FACTION_COMBO, _index, _index];
  _index = _index + 1;
} foreach Z_FACTIONLIST;
lbSetCurSel [DLG_Z_FACTION_COMBO, 0];


while {dialog} do {
  if (Z_TYPE_SELECTED!="" ) then { 
    ZCURLIST = 
    switch (Z_TYPE_SELECTED) do
    {
      case 'men': {Z_MENLIST};
      case 'vehicles': {Z_VEHLIST};
      case 'things': {Z_THINGLIST};
      case 'houses' : {Z_HOUSELIST};
    };
    lbClear DLG_Z_LIST;
    _index=0;
//    [ZCURLIST] call z_diaglog;
    for "_i" from 0 to (count ZCURLIST)-1 do {
    	_array = ZCURLIST select _i;
    	_faction=_array select 3;
    	_text = format ["%1 %2 %3",_array select 0,_array select 2, _faction];
    	if (_faction==Z_FACTION) then { 
      	lbAdd [DLG_Z_LIST,format["%1",_text]];
      	lbSetValue [DLG_Z_LIST, _index, _i];
        _index = _index + 1;
    	};
    	
    //	lbSetPicture [DLG_Z_LIST, _i, _array select 1];
    	
    };
    Z_TYPE_LIST=Z_TYPE_SELECTED;
    Z_TYPE_SELECTED="";
    //format["_index %1 ", _index] call z_smsg;
  };
  if (Z_SELECTED) then {   // the user want to create this object
    _lbidx = lbCurSel DLG_Z_LIST;
    _index = lbValue [DLG_Z_LIST, _lbidx];
		//_selected = (ZCURLIST select _index) select 0;
		_selected = ZCURLIST select _index;
    if (Z_TYPE_LIST=="men") then {
		  _vehicle = [(ZCURLIST select _index) select 2, getPosASL player,getDir player] call z_createunit;
		  z_last_created_unit = _vehicle;
		  z_selected_unit = z_last_created_unit;
		}else{
		  _vehicle = [(ZCURLIST select _index) select 2, getPosASL player,getDir player] call z_createvehicle;
    };
		z_objects = z_objects + [_vehicle];
		Z_SELECTED=false;
	};
  
};

