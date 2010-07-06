//////////////////////////////////////////////////////////////////
// Function file for Armed Assault 2
// Created by: =[A*C]= Z
// Attache un markeur à un vehicule
//////////////////////////////////////////////////////////////////
private [
			"_veh",
			"_markertype",
			"_markercolor",
			"_vehname",
			"_mkname",
			"_pos",
			"_vehmk"
			];
_veh = _this select 0;
_markertype = _this select 1;
_markercolor = _this select 2;

_vehname = vehicleVarName _veh;
_mkname = format ['mk%1v',_vehname];
_pos= getpos _veh;
deleteMarker _mkname;
_vehmk = createMarker [_mkname, _pos];
_vehmk setMarkerType _markertype;
_vehmk setMarkerColor _markercolor;
_vehmk setMarkerText format ['%1',_vehname];
