/*//////////////////////////////////////////////////////////////////
 Function file for Armed Assault 2
 Created by: =[A*C]= Z
	


/////////////////////////////////////////////////////////////////*/
Z_VEHCLASSES = ["car", "motorcycle", "tank", "helicopter", "airplane"];
Z_STATICCLASSES = ["StaticWeapon"];
Z_MENCLASSES = ["soldier"];
Z_VEHLIST = [];
Z_STATICLIST = [];
Z_MENLIST = [];




    _CfgVehicles = configFile >> "CfgVehicles";
  	_result=[];
  	for "_i" from 1 to (count _CfgVehicles - 1) do {
  	   
    	_CfgVehicle = _CfgVehicles select _i;
    	
      if (getNumber(_CfgVehicle >> "scope") == 2) then {
    	   _vehicleClass = getText(_CfgVehicle >> "displayName");
    	   _picture = getText(configFile >> "CfgVehicles" >> _vehicleClass >> "picture");
    	   _simulation = getText(_CfgVehicle>> "simulation");
    	   _faction = getText(_CfgVehicle >> "faction");
    	   _configName = configName(_CfgVehicle);
    	   if (_simulation in Z_VEHCLASSES) then {
  //  	     Z_VEHCLASSES = Z_VEHCLASSES + [[_vehicleClass,_picture,_configName]];
            Z_VEHLIST = Z_VEHLIST + [[_vehicleClass,_picture,_configName,_faction]];
    	   };
    	   if (_simulation in Z_STATICCLASSES) then {
            Z_STATICLIST = Z_STATICLIST + [[_vehicleClass,_picture,_configName,_faction]];
    	   };
    	   if (_simulation in Z_MENCLASSES) then {
            Z_MENLIST = Z_MENLIST + [[_vehicleClass,_picture,_configName,_faction]];
    	   };
  	   };
  	};
  	
  	
  	


