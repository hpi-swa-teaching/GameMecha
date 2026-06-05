initialize-release
initialize

	super initialize.
	self
		radius: 10px;
		color: Color yellow;
		speed: 20px.
	self collider addChild: (GMPrimitiveCircleCollider new radius: self radius)