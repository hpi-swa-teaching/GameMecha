instance creation
newWithImage: imageName bounds: bounds
	^ self new
		bounds: bounds;
		initializeImage: imageName;
		yourself.