/*
 * Author: SethosII
 * 
 * Purpose:
 * creates boundary with h-barrier corridors around specified zone and selects a random area not in water if no position is chosen (when positionX/Y is zero)
 * creates a trigger for the zone, which can be used to cover the remaining area of the map, sets positionFound to true when created
 * creates a respawn marker for the zone
 *
 * Parameter:
 * _this select 0: width
 * _this select 1: length
 * _this select 2: angle
 * _this select 3: position x
 * _this select 4: position y
 * _this select 5: map dimension x
 * _this select 6: map dimension y
 *
 * Returns:
 * true when completed
 *
 * Example:
 * _generate_tdm_area_sqf = [100, 50, 45, 0, 0, 31000, 31000] execVM "scripts\generate_tdm_area.sqf";
 */

 if (isServer) then {
	params [
		// zone dimensions
		["_sizeX", 0, [0]],
		["_sizeY", 0, [0]],
		["_angle", 0, [0]],
		["_centerX", 0, [0]],
		["_centerY", 0, [0]],
		// map dimensions
		["_maxSizeX", 0, [0]],
		["_maxSizeY", 0, [0]]
	];

	private ["_objectName", "_objectWidth", "_objectLength", "_objectHeigth", "_inWater", "_leftTopX", "_leftTopY", "_leftBottomX", "_leftBottomY", "_rightTopX", "_rightTopY", "_rightBottomX", "_rightBottomY", "_bottomLength", "_rotationBottom", "_boundary", "_topLength", "_rotationTop", "_leftLength", "_rotationLeft", "_rightLength", "_rotationRight"];

	// object for boundary
	_objectName = "Land_HBarrierWall_corridor_F";
	_objectWidth = 5.5;
	_objectLength = 4;
	_objectHeigth = 2.7;

	// find starting position not in water
	if (_centerX == 0 && _centerY == 0) then {
		_inWater = true;
		while {_inWater} do {
			_centerX = random _maxSizeX;
			_centerY = random _maxSizeY;
			_inWater = surfaceIsWater [_centerX, _centerY] || surfaceIsWater [_centerX - 100, _centerY] || surfaceIsWater [_centerX + 100, _centerY] || surfaceIsWater [_centerX, _centerY - 100] || surfaceIsWater [_centerX, _centerY + 100];
		};
	};

	// edges
	_leftTopX = cos _angle * (- _sizeX / 2) - sin _angle * (_sizeY / 2) + _centerX;
	_leftTopY = sin _angle * (- _sizeX / 2) + cos _angle * (_sizeY / 2) + _centerY;
	_leftBottomX = cos _angle * (- _sizeX / 2) - sin _angle * (- _sizeY / 2) + _centerX;
	_leftBottomY = sin _angle * (- _sizeX / 2) + cos _angle * (- _sizeY / 2) + _centerY;
	_rightTopX = cos _angle * (_sizeX / 2) - sin _angle * (_sizeY / 2) + _centerX;
	_rightTopY = sin _angle * (_sizeX / 2) + cos _angle * (_sizeY / 2) + _centerY;
	_rightBottomX = cos _angle * (_sizeX / 2) - sin _angle * (- _sizeY / 2) + _centerX;
	_rightBottomY = sin _angle * (_sizeX / 2) + cos _angle * (- _sizeY / 2) + _centerY;

	// create bottom boundary
	_bottomLength = [_leftBottomX, _leftBottomY] distance2D [_rightBottomX, _rightBottomY];
	_rotationBottom = 180 + _angle;
	for "_x" from 0 to _bottomLength + _objectWidth step _objectWidth do {
		_boundary = createVehicle [_objectName, [_leftBottomX + sin _angle * (_objectLength / 2) + cos _angle * _x, _leftBottomY - cos _angle * (_objectLength / 2) + sin _angle * _x, 0], [], 0, "CAN_COLLIDE"];
		_boundary setDir (360 - _rotationBottom);
		_boundary = createVehicle [_objectName, [_leftBottomX + sin _angle * (_objectLength / 2) + cos _angle * _x, _leftBottomY - cos _angle * (_objectLength / 2) + sin _angle * _x, _objectHeigth], [], 0, "CAN_COLLIDE"];
		_boundary setDir (360 - _rotationBottom);
	};

	// create top boundary
	_topLength = [_leftTopX, _leftTopY] distance2D [_rightTopX, _rightTopY];
	_rotationTop = 0 + _angle;
	for "_x" from 0 to _topLength + _objectWidth step _objectWidth do {
		_boundary = createVehicle [_objectName, [_rightTopX - sin _angle * (_objectLength / 2) - cos _angle * _x, _rightTopY + cos _angle * (_objectLength / 2) - sin _angle * _x, 0], [], 0, "CAN_COLLIDE"];
		_boundary setDir (360 - _rotationTop);
		_boundary = createVehicle [_objectName, [_rightTopX - sin _angle * (_objectLength / 2) - cos _angle * _x, _rightTopY + cos _angle * (_objectLength / 2) - sin _angle * _x, _objectHeigth], [], 0, "CAN_COLLIDE"];
		_boundary setDir (360 - _rotationTop);
	};

	// create _left boundary
	_leftLength = [_leftBottomX, _leftBottomY] distance2D [_leftTopX, _leftTopY];
	_rotationLeft = 90 + _angle;
	for "_x" from 0 to _leftLength + _objectWidth step _objectWidth do {
		_boundary = createVehicle [_objectName, [_leftTopX - cos _angle * (_objectLength / 2) + sin _angle * _x, _leftTopY - sin _angle * (_objectLength / 2) - cos _angle * _x, 0], [], 0, "CAN_COLLIDE"];
		_boundary setDir (360 - _rotationLeft);
		_boundary = createVehicle [_objectName, [_leftTopX - cos _angle * (_objectLength / 2) + sin _angle * _x, _leftTopY - sin _angle * (_objectLength / 2) - cos _angle * _x, _objectHeigth], [], 0, "CAN_COLLIDE"];
		_boundary setDir (360 - _rotationLeft);
	};

	// create _right boundary
	_rightLength = [_rightBottomX, _rightBottomY] distance2D [_rightTopX, _rightTopY];
	_rotationRight = 270 + _angle;
	for "_x" from 0 to _rightLength + _objectWidth step _objectWidth do {
		_boundary = createVehicle [_objectName, [_rightBottomX + cos _angle * (_objectLength / 2) - sin _angle * _x, _rightBottomY + sin _angle * (_objectLength / 2) + cos _angle * _x, 0], [], 0, "CAN_COLLIDE"];
		_boundary setDir (360 - _rotationRight);
		_boundary = createVehicle [_objectName, [_rightBottomX + cos _angle * (_objectLength / 2) - sin _angle * _x, _rightBottomY + sin _angle * (_objectLength / 2) + cos _angle * _x, _objectHeigth], [], 0, "CAN_COLLIDE"];
		_boundary setDir (360 - _rotationRight);
	};

	/*// object for edges
	createVehicle ["Land_Communication_F", [_leftBottomX, _leftBottomY, 0], [], 0, "CAN_COLLIDE"];
	createVehicle ["Land_Communication_F", [_leftTopX, _leftTopY, 0], [], 0, "CAN_COLLIDE"];
	createVehicle ["Land_Communication_F", [_rightBottomX, _rightBottomY, 0], [], 0, "CAN_COLLIDE"];
	createVehicle ["Land_Communication_F", [_rightTopX, _rightTopY, 0], [], 0, "CAN_COLLIDE"];
	hint format["%1,%2",_leftBottomY,_leftTopY];*/

	// cover non combat area on map
	areaTrigger setTriggerArea [_sizeX / 2, _sizeY / 2, 360 - _angle, true];
	areaTrigger setPos [_centerX, _centerY, 0];
	positionFound = true;

	// create respawn marker
	_respawnMarker = createMarker ["respawn", [_centerX, _centerY]];
	_respawnMarker setMarkerShape "RECTANGLE";
	_respawnMarker setMarkerDir (360 - _angle);
	_respawnMarker setMarkerSize [_sizeX / 2, _sizeY / 2];
	_respawnMarker setMarkerBrush "Border";
	_respawnMarker setMarkerColor "ColorBlack";
};

true