instance creation
position: aPoint extent: anExtent

	^ (self new)
		setPlaceholderWithExtent: anExtent color: self placeHolderColor;
		position: aPoint