animatedImages
createAnimatedImagesOnDisk
	self createFolder: self testResourceFolder.
	(StandardFileStream forceNewFileNamed: self testImagePathGIF)
		nextPutAll: self squeakGIFContents base64Decoded;
		close.