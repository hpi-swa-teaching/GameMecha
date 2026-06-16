initialize-release
initialize

	super initialize.
	self
		layers: #();
		mask: #();
		initializeProperties;
		initializeCollider