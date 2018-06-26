as yet unclassified
imageManager
	^ ImageManager ifNil: [ImageManager := GMImageLoader new]