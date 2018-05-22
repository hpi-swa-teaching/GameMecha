as yet unclassified
initialize
	super initialize.
	self image: (GMImageManager instance 
		loadAllResourcesFrom: TestResourceCreator testResourceFolder;
		getImageForm: TestResourceCreator testImageName).
	self abandon.