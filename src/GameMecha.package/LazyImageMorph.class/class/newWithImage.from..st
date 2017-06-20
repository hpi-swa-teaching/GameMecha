as yet unclassified
newWithImage: imageName from: cache
	^ self new
		color: Color green;
		initializeImage: imageName from:  cache;
		yourself.