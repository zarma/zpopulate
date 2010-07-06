//////////////////////////////////////////////////////////////////
// Function file for Armed Assault 2
// Created by: =[A*C]= Z
// Functions for dialogs only
//////////////////////////////////////////////////////////////////
#include "z_def.hpp"

z_deleteSelectedObject = {
  private ["_object","_lbidx","_index"];
  
  _lbidx = lbCurSel DLG_Z_LISTSEL;
  _index = lbValue [DLG_Z_LISTSEL, _lbidx];
	
  lbDelete [DLG_Z_LISTSEL, _lbidx];
  
  _object = z_objects select _index;
  deletevehicle _object;
  
  format["_object %1  _lbidx %2 _index %3", _object,_lbidx,_index] call z_smsg ;
  z_objects = z_objects - [_object];
};

