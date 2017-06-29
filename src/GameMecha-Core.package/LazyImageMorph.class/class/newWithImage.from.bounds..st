as yet unclassified
newWithImage: imageName from: cache bounds: bounds
	^ self new
		bounds: bounds;
		color: Color green;
		initializeImage: imageName from:  cache;
		yourself.