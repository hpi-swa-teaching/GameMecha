initialize-release
initialize

	super initialize.
	self
		layers: #();
		mask: #();
		collider: (GMCompositeCollider new parent: self)