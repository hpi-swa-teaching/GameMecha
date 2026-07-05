initialize-release
initialize

	super initialize.
	self
		extent: 1200 px @ 900 px;
		color: self browserColor;
		initializeUI;
		initializeColliderTree;
		openInWindow