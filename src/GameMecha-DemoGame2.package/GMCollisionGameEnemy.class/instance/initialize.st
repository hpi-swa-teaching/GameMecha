initialization
initialize

	super initialize.
	self 
		radius: 50px;
		color: Color blue;
		speed: 5px;
		layers: #(4);
		mask: #(5).	
	self collider addChild: (GMPrimitiveCircleCollider new radius: self radius)