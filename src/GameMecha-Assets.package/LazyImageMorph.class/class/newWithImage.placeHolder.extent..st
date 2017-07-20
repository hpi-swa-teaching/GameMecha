instance creation
newWithImage: imageName placeHolder: color extent: extent
	^ self new
		extent: extent;
		color: color;
		initializeImage: imageName;
		yourself.