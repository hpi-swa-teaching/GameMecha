as yet unclassified
stringFromResource: anImage
	^ (WriteStream on: '') 
		store: anImage;
		contents