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


createDialog "Z_Dialog_selected";
sleep 1;
_dlg = findDisplay DLG_Z_IDDSEL;

_ctrlList = _dlg displayCtrl DLG_Z_LISTSEL;

// TODO INIT LIST TO DISPLAY DISPLAYNAME, CLASSNAME, FACTION 

//while {dialog} do {
  
    ZCURLIST = z_objects;    
    lbClear DLG_Z_LISTSEL;
    for "_i" from 0 to (count ZCURLIST)-1 do {
    	_array = ZCURLIST select _i;
    //	_text = format ["%1 %2",_array select 2, _array select 3];
    //gettext (configFile > "CfgVehicles" >> (typeof _array) >> "displayName")
      _text =  _array;
    	lbAdd [DLG_Z_LISTSEL,format["%1",_text]];
    	lbSetValue [DLG_Z_LISTSEL, _i, _i];
    };
  
 
