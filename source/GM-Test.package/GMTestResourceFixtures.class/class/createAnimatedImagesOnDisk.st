animatedImages
createAnimatedImagesOnDisk
	GMTestResourceFixtures createTestingResourceFolder.
	(StandardFileStream forceNewFileNamed: self testImagePathGIF)
		nextPutAll: self squeakGIFContents base64Decoded;
		close.