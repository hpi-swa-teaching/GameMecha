as yet unclassified
newWithImage: imageName from: cache extent: extent
	^ self new
		extent: extent;
		color: Color green;
		initializeImage: imageName from:  cache;
		yourself.