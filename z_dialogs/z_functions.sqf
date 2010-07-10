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
  z_objects = z_objects - [_object];
};

z_selectFaction = {
    _lbidx = lbCurSel DLG_Z_FACTION_COMBO;
    _index = lbValue [DLG_Z_FACTION_COMBO, _lbidx];  
    Z_FACTION=Z_FACTIONLIST select _index;
    Z_TYPE_SELECTED=Z_TYPE_LIST; // force refresh list
}; 