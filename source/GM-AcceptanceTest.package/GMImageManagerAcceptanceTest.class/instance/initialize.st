as yet unclassified
initialize
	super initialize.
	self image: (GMImageManager instance 
		loadAllResourcesFrom: TestResourceCreator testResourceFolder;
		getImageForm: TestResourceCreator testImageNamePNG).
	self abandon.