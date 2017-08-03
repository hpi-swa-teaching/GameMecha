instance creation
newWithImage: imageName
	^ self new
		initializeImage: imageName;
		yourself.