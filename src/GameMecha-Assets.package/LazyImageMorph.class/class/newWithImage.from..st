instance creation
newWithImage: imageName from: cache
	^ self new
		color: Color green;
		initializeImage: imageName fromCache:  cache;
		yourself.