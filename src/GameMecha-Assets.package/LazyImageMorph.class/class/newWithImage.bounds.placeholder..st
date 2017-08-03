instance creation
newWithImage: imageName bounds: bounds placeholder: placeholderColor
	^ self new
		bounds: bounds;
		placeholderColor: placeholderColor;
		initializeImage: imageName;
		yourself.