initialize-release
initialize

	super initialize.
	self
		extent: 1200 px @ 900 px;
		color: self browserColor;
		initializeUI;
		initializeColliderTree;
		openInWindow.
	UIManager default inform: 'IMPORTANT NOTE: This editor assumes that the targeted morph is scaled to the global scale factor. To do this, you must append px to its extent values.

If you dont use px, collider positions and sizes will become inaccurate when different scale factors are applied.

It is therefore recommended to use px throughout your game whenever values relate to extents. This also ensures that your game scales correctly and remains playable across different screen sizes.'