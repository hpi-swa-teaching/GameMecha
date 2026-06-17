initialize-release
initialize

	super initialize.
	self
		mask: #();
		layers: #();
		initializeProperties;
		initializeCollider