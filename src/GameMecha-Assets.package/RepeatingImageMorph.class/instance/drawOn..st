drawing
drawOn: aCanvas
	| style scaledImage |
	(style := self borderStyle) ifNotNil:[
		style frameRectangle: bounds on: aCanvas.
	].
	scaledImage := (image magnifyBy: self baseScale) repeatedToExtent: self extent withOrigin: self offset.
	self isOpaque
		ifTrue:[aCanvas drawImage: scaledImage at: self innerBounds origin]
		ifFalse:[aCanvas translucentImage: scaledImage at: self innerBounds origin].