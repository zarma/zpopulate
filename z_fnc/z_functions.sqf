//////////////////////////////////////////////////////////////////
// Function file for Armed Assault 2
// Created by: =[A*C]= Z
//////////////////////////////////////////////////////////////////

// gestion d es messages
z_smsg = {
  	[playerSide,"HQ"] sideChat _this;
};

z_diaglog = {
    _el =  _this select 0;
    if (typename _el == "ARRAY") then {
        _i=0;
        {
        diag_log text format["|=_i %2  ====   %1   ==|", _x,_i];
        _i=_i+1;
        }foreach _this;
   }else{
      diag_log text format["|=====   %1   ==|", _this]; 
    };
    
};


z_stock_info_object = {

    private ["_object","_pos","_dir","_str","_T","_textC"];
    
 //   format["_this %1 ", _this] call z_smsg;
    _object = _this select 0;
    _pos = getposASL _object;
    _dir = getdir _object;
    
    _str = "<type>"+typeOf _object+"</type>"+"<number>"+format["%1",z_nbobject]+"</number>";
    _str = _str + "<setPosASL>"+format["%1",_pos]+"</setPosASL>";
    _str = _str + "<setDir>"+format["%1",_dir]+"</setDir>";
    _T = ["<createVehicle >"+_str+"</createVehicle>"];
    
    z_nbobject = z_nbobject + 1;
    z_posarrayobject = z_posarrayobject  + _T; 
    hint format["_T %1",_T];
        
    _textC = "";
    {
    	_textC = _textC + _x;
    } forEach z_posarrayobject;
    copyToClipboard _textC;
    
};

z_createVehicle = {
// TODO CREATE MARKER IN POSITION WITH DISPLAYNAME
  private ["_vehicle","_position","_dir"];
  _typevehicle = _this select 0;
  _position = _this select 1;
  _dir  = _this select 2;
//  _vehicle = _typevehicle createVehicle [1,1,0];
  _vehicle =  createVehicle [_typevehicle, [1,1,0], [], 0, "CAN_COLLIDE"];
  _vehicle setPosASL _position;
	_vehicle setdir _dir;
	_action = _vehicle addAction [("<t color=""#dddd00"">take object</t>"), "z_scripts\z_takeobject.sqf", nil, 5, true, true];
	_vehicle
};

z_createUnit = {
// TODO CREATE MARKER IN POSITION WITH DISPLAYNAME
  private ["_unit","_position","_dir","_side"];
//  hint format["z_createUnit %1",_this];
  _type = _this select 0;
  _position = _this select 1;
  _dir  = _this select 2;
  _side=[_type] call z_side;
  _group = createGroup _side;
  _unit = _group createUnit [_type, [1,1,0.2], [], 0, 'CAN_COLLIDE'];
  _unit setPosASL _position;
	_group setFormDir _dir;
	_nil=[_unit,"mil_triangle","ColorBlue"] execVM "z_scripts\z_vehmarker.sqf";
	_unit
};


z_objetcinfo = {
  private ["_object"];
  _object = _this select 0;
  _kind = "vehicle";
  if (_object iskindof "Man") then {
    _kind = "unit";
  };
  _type = typeOf _object;
  _pos = getposASL _object;
  _dir = getdir _object;
  _result = [_kind,_type,_pos,_dir];
  hint format["_result z_objetcinfo %1",_result];
  _result
};

z_generatesqf = {
  
  _text = "";
  {
    private ["_side"];
    _str = "<type>"+typeOf _x+"</type>"+"<number>"+format["%1",z_nbobject]+"</number>";
    _str = _str + "<setPosASL>"+format["%1",getposASL _x]+"</setPosASL>";
    _str = _str + "<setDir>"+format["%1",getdir _x]+"</setDir>";
    
    _T = "<createVehicle >" + _str + "</createVehicle>";
    
    if (_x iskindof "Man") then {
      	_str = _str + "<addWeapon>"+format["%1",weapons _x]+"</addWeapon>";
      	_str = _str + "<addMagazine>"+format["%1",magazines _x]+"</addMagazine>";
      	_str = _str + "<side>"+format["%1",side _x]+"</side>";
        _T = "<createUnit>"+_str+"</createUnit>";
    };
  
    _text =  _text + _T;
    z_nbobject = z_nbobject + 1;
  }foreach z_objects;
  
  hint format["Code generated for %1",z_objects];
//  hint format["Code generated %1",_text];
  
  copyToClipboard _text;
};

z_side = {
  _objectclass = _this select 0; 
  _sidenumber = getnumber(configfile >> "CfgVehicles" >>  _objectclass >> "side");
  _side = z_sidelist select _sidenumber;
  //hint format["z_side %1 >> %2",_object,_side];
  _side
};

//  FACTIONS
z_factions =  {
  private ["_factionClasses","_factions","_element","_side","_sides","_sidelist"];
	_factionClasses = (configfile >> "CfgFactionClasses");
	_factions = [];
	_sides = [];
	_sidelist = [east,west,resistance,civilian];

	for "_i" from 1 to (count _factionClasses - 1) do {
		_element = _factionClasses select _i;
		if (isclass _element) then {
    	_side = getnumber(_element >> "side");
			if (_side >= 0) then {
				_factions = _factions + [configname _element];
				_sides = _sides + [_sidelist select _side];
			};
		};
	};
	_factions=_factions+["Default"];
	_factions
};

// TO DELETE CODE ABOVE

z_configtest = {

  	_CfgVehicles = configFile >> "CfgVehicles";
  	_result=[];
  	for "_i" from 1 to (count _CfgVehicles - 1) do {
  	   _ConfigVehicle = _CfgVehicles select _i;
  	   _vehicleClass = getText(_ConfigVehicle >> "displayName");
  	   _picture = getText(configFile >> "CfgVehicles" >> _vehicleClass >> "picture");
  	   _configName = configName(_ConfigVehicle);
//  	   if (getText (configFile >> "CfgVehicles" >> _vehicleClass >> "displayName") != "") then {
  	     _result = _result + [[_vehicleClass,_picture,_configName]];
//  	   };
  	  
  	   
  	};

  	_result  	
};