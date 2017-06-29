as yet unclassified
drawOn: aCanvas
	| style |
	(style := self borderStyle) ifNotNil:[
		style frameRectangle: bounds on: aCanvas.
	].
	self isOpaque
		ifTrue:[aCanvas drawImage: (image repatedToExtent: self extent withOrigin: self offset) at: self innerBounds origin]
		ifFalse:[aCanvas translucentImage: (image repatedToExtent: self extent withOrigin: self offset) at: self innerBounds origin].