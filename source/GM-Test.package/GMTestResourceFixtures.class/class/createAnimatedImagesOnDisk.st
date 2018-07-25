animatedImages
createAnimatedImagesOnDisk
	self createFolder: self testResourceFolder.
	(StandardFileStream forceNewFileNamed: self testImagePathGIF)
		nextPutAll: self squeakGIFContents base64Decoded;
		close.
	(StandardFileStream forceNewFileNamed: self testImagePathGIF2)
		nextPutAll: self squeakGIF2Contents base64Decoded;
		close.