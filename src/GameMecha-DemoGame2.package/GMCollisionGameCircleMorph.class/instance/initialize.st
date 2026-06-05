initialize-release
initialize

	super initialize.
	self
		mask: #();
		layers: #();
		collider: (GMCompositeCollider new parent: self)