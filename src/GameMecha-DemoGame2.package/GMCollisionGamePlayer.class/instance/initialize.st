initialize-release
initialize

	super initialize.
	self
		width: 50px;
		height: 50px;
		color: Color red;
		speed: 10px;
		shootTimer: 0;
		shootInterval: 50;
		ammo: 5.
	self collider addChild: (GMPrimitiveRectangleCollider new
		width: self width;
		height: self height)
