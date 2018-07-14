as yet unclassified
stringFromResource: anAnimatedGIFReadWriter
	^ (WriteStream on: '') 
		nextPutAll: ' AnimatedGIFReadWriter formsFromStream: (ReadStream on: ';
		store: anAnimatedGIFReadWriter;
		nextPutAll: ' base64Decoded asByteArray)';
		contents