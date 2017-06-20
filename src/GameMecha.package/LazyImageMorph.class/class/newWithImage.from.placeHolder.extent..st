as yet unclassified
newWithImage: imageName from: cache placeHolder: color extent: extent
	^ self new
		extent: extent;
		color: color;
		initializeImage: imageName from:  cache;
		yourself.