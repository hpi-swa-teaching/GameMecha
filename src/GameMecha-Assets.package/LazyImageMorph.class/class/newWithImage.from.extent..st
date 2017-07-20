instance creation
newWithImage: imageName from: cache extent: extent
	^ self new
		extent: extent;
		color: Color green;
		initializeImage: imageName fromCache:  cache;
		yourself.