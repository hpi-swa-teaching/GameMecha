as yet unclassified
stringFromFile: aFilename
	^ (WriteStream on: '') 
		store: (self resourceFromDrive: aFilename);
		contents