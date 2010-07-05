//////////////////////////////////////////////////////////////////
// Function file for Armed Assault 2
// Created by: =[A*C]= Z
//////////////////////////////////////////////////////////////////
// gestion d es messages
z_smsg = {
  	[playerSide,"HQ"] sideChat _this;
};

z_stock_info_object = {

    private ["_object","_pos","_dir","_str","_T","_textC"];
    
    format["_this %1 ", _this] call z_smsg;
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
  _vehicle = _typevehicle createVehicle [1,1,0];
  _vehicle setPosASL _position;
	_vehicle setdir _dir;
	_vehicle
};

z_createUnit = {
// TODO CREATE MARKER IN POSITION WITH DISPLAYNAME
  private ["_unit","_position","_dir","_side"];
  hint format["z_createUnit %1",_this];
  _type = _this select 0;
  _position = _this select 1;
  _dir  = _this select 2;
  _side=east;
  _group = createGroup _side;
  _unit = _group createUnit [_type, [1,1,0.2], [], 0, 'CAN_COLLIDE'];
  _unit setPosASL _position;
	_group setFormDir _dir;
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
  
    _str = "<type>"+typeOf _x+"</type>"+"<number>"+format["%1",z_nbobject]+"</number>";
    _str = _str + "<setPosASL>"+format["%1",getposASL _x]+"</setPosASL>";
    _str = _str + "<setDir>"+format["%1",getdir _x]+"</setDir>";
    
    _T = "<createVehicle >" + _str + "</createVehicle>";
    
    if (_x iskindof "Man") then {
      	_str = _str + "<addWeapon>"+format["%1",weapons _x]+"</addWeapon>";
      	_str = _str + "<addMagazine>"+format["%1",magazines _x]+"</addMagazine>";
        _T = "<createUnit>"+_str+"</createUnit>";
    };
  
    _text =  _text + _T;
    z_nbobject = z_nbobject + 1;
  }foreach z_objects;
  
  hint format["Code generated %1",_text];
  
  copyToClipboard _text;
};

z_side = {
_object = _this select 0; 
_sidelist = ["east","west","resistance","civilian"];
_sidenumber = getnumber(_object >> "side");
_side = _sidelist select _sidenumber;
hint format["z_side %1 >> %2",_object,_side];
_side
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