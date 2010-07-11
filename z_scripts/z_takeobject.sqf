
    private ["_object"];   
 //   format["_this %1 ", _this] call z_smsg;
    _object = _this select 0;
    _object attachTo [player, [
		0,
		(((boundingBox _object select 1 select 1) max (-(boundingBox _object select 0 select 1))) max ((boundingBox _object select 1 select 0) max (-(boundingBox _object select 0 select 0)))) + 1,
		1]
	];
	_action = player addAction [("<t color=""#dddd00"">release object</t>"), "z_scripts\z_releaseobject.sqf", _object, 5, true, true];
	z_releasedobject=false;
  waituntil{z_releasedobject};
  player removeaction _action;