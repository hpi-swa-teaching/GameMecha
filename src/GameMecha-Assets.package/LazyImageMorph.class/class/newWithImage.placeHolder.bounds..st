instance creation
newWithImage: imageName placeHolder: color bounds: bounds
	^ self new
		bounds: bounds;
		color: color;
		initializeImage: imageName;
		yourself.