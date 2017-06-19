as yet unclassified
initializeImage: imageName from: cache
	self borderWidth: 0.
	cache getTexture: imageName andDo: [:form | 
		|prevBounds postBounds|
		prevBounds := self bounds.
		self transform: (form scaledToSize: self bounds extent). 
		self changed.
		postBounds := self bounds.
		(postBounds ~= prevBounds) ifTrue: [WrongAspectRatio signal]
		].