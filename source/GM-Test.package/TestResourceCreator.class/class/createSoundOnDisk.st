images
createSoundOnDisk
	| temporaryStream |
	self createTestingResourceFolder.
	temporaryStream := ByteArray new writeStream.
	JPEGReadWriter2 putForm: self squeakGIF onStream: temporaryStream.
	self saveStream: temporaryStream onPath: self testImagePathJPEG.