as yet unclassified
imageManager
	^ ImageManager ifNil: [self imageManager: GMImageManager new]