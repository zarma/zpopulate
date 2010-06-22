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
disableSerialization; // A cause des displayCtrl

format["z_objects %1  ", z_objects] call z_smsg;

createDialog "Z_Dialog_selected";
sleep 1;
_dlg = findDisplay DLG_Z_IDDSEL;

_ctrlList = _dlg displayCtrl DLG_Z_LISTSEL;

// TODO INIT LIST TO DISPLAY DISPLAYNAME, CLASSNAME, FACTION 

//while {dialog} do {
  
    ZCURLIST = z_objects;    
    format["ZCURLIST %1  ", ZCURLIST] call z_smsg;
    lbClear DLG_Z_LISTSEL;
    for "_i" from 0 to (count ZCURLIST)-1 do {
    	_array = ZCURLIST select _i;
    //	_text = format ["%1 %2",_array select 2, _array select 3];
    //gettext (configFile > "CfgVehicles" >> (typeof _array) >> "displayName")
      _text =  _array;
    	lbAdd [DLG_Z_LISTSEL,format["%1",_text]];
    	lbSetValue [DLG_Z_LISTSEL, _i, _i];
    };
  
 /* if (Z_SELECTED) then {   // the user want to create this object
    _lbidx = lbCurSel DLG_Z_LIST;
    _index = lbValue [DLG_Z_LIST, _lbidx];
		_selected = (ZCURLIST select _index) select 0;
		 [(ZCURLIST select _index) select 2, getPosASL player,getDir player] spawn z_createvehicle;
		hint format ["selected : %1 ", _selected];
		Z_SELECTED=false;
	};*/
//};

