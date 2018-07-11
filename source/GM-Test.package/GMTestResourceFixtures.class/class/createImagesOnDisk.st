images
createImagesOnDisk
	self createFolder: self testResourceFolder.
	JPEGReadWriter2 putForm: self squeakJPEG onFileNamed: self testImagePathJPEG.
	PNGReadWriter putForm: self squeakPNG onFileNamed: self testImagePathPNG.