instance creation
newWithImage: imageName from: cache placeHolder: color bounds: bounds
	^ self new
		bounds: bounds;
		color: color;
		initializeImage: imageName fromCache:  cache;
		yourself.