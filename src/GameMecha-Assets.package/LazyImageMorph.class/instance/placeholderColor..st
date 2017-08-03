accessing
placeholderColor: anObject
	|img|
	img := self image.
	img fill: (0@0 extent: self extent) fillColor: anObject.
	self image: img.