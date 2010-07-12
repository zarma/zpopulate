
    private ["_object","_typevehicle","_dir","_position"];   
 //   format["_this %1 ", _this] call z_smsg;
    hint "3s before object spawn";
    sleep 3; //  the player have 3s to move before the object spawn
    _typevehicle = _this select 3;    
    _dir  = getDir player;
    _position = getPosASL player;
    
    _object = [_typevehicle,_position,_dir] call z_createVehicle;

/*    
    _object =  createVehicle [_typevehicle, [1,1,0], [], 0, "CAN_COLLIDE"];
    _object setPosASL _position;
	  _object setdir _dir;
	  _action = _object addAction [("<t color=""#dddd00"">take object</t>"), "z_scripts\z_takeobject.sqf", nil, 5, true, true];
	  _action = _object addAction [("<t color=""#dddd00"">copy object</t>"), "z_scripts\z_copyobject.sqf", _typevehicle, 5, true, true];
	  z_objects = z_objects + [_object];
    sleep 5;   
*/   
    _object attachTo [player, [
		0,
		(((boundingBox _object select 1 select 1) max (-(boundingBox _object select 0 select 1))) max ((boundingBox _object select 1 select 0) max (-(boundingBox _object select 0 select 0)))) + 1,
		1]
	];
	_action = player addAction [("<t color=""#dddd00"">release object</t>"), "z_scripts\z_releaseobject.sqf", _object, 5, true, true];
	z_releasedobject=false;
  waituntil{z_releasedobject};
  player removeaction _action;