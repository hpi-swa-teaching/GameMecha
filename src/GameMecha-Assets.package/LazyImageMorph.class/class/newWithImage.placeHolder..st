instance creation
newWithImage: imageName placeHolder: color
	^ self new
		color: color;
		initializeImage: imageName;
		yourself.