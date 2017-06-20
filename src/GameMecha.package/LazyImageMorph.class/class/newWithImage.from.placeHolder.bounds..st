as yet unclassified
newWithImage: imageName from: cache placeHolder: color bounds: bounds
	^ self new
		bounds: bounds;
		color: color;
		initializeImage: imageName from:  cache;
		yourself.