initialize-release
initialize

	super initialize.
	self 
		mask: #(1);
		layers: #(8);
		width: 500px;
		height: 300px;
		color: (TranslucentColor blue alpha: 0.1).
	self collider addChild: (GMPrimitiveRectangleCollider new
		width: self width;
		height: self height)