
     private ["_object"];   
 //   format["_this %1 ", _this] call z_smsg;
    _object = _this select 3;
    detach _object;
    _object setPosASL [getPosASL _object select 0, getPosASL _object select 1,getPosASL player select 2];
//	  _object setVelocity [0, 0, 0];
    z_releasedobject=true;
