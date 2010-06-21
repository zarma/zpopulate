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

format["Z_MENLIST %1  ", Z_MENLIST] call z_smsg;

createDialog "Z_Dialog";
sleep 1;
_dlg = findDisplay DLG_Z_IDD;

_ctrlList = _dlg displayCtrl DLG_Z_LIST;

while {dialog} do {
  waitUntil { Z_TYPE_SELECTED!="" }; 
  
  _list = 
  switch (Z_TYPE_SELECTED) do
  {
    case 'men': {Z_MENLIST};
    case 'vehicles': {Z_VEHLIST};
  };
  format["_list %1  ", _list] call z_smsg;
  lbClear DLG_Z_LIST;
  for "_i" from 0 to (count _list)-1 do {
  	_array = _list select _i;
  	lbAdd [DLG_Z_LIST,format["%1",_array select 2]];
  //	lbSetPicture [DLG_Z_LIST, _i, _array select 1];
  	lbSetValue [DLG_Z_LIST, _i, _i];
  };
  Z_TYPE_SELECTED="";
  //format["_index %1 ", _index] call z_smsg;

};

hint "dialog ends";