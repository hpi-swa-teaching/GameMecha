images
createImagesOnDisk
	| temporaryStream |
	temporaryStream := ByteArray new writeStream.
	JPEGReadWriter2 putForm: self squeakGIF onStream: temporaryStream.
	self saveStream: temporaryStream onPath: self testImagePathJPEG.
	
	temporaryStream := ByteArray new writeStream.
	PNGReadWriter putForm: self squeakGIF onStream: temporaryStream.
	self saveStream: temporaryStream onPath: self testImagePathPNG.