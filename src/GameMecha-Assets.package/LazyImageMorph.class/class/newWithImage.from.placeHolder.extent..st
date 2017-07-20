instance creation
newWithImage: imageName from: cache placeHolder: color extent: extent
	^ self new
		extent: extent;
		color: color;
		initializeImage: imageName fromCache:  cache;
		yourself.