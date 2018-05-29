images
createImagesOnDisk
	TestResourceFixtures createTestingResourceFolder.
	JPEGReadWriter2 putForm: self squeakGIF onFileNamed: self testResourceFolder, self testImageNameJPEG.
	PNGReadWriter putForm: self squeakPNG onFileNamed: self testResourceFolder, self testImageNamePNG.