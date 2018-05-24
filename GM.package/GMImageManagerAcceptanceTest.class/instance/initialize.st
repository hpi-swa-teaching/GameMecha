as yet unclassified
initialize
	super initialize.
	self image: (GMImageManager instance 
		loadAllResourcesFrom: TestResourceFixtures testResourceFolder;
		getImageForm: TestResourceFixtures testImageNamePNG).
	self abandon.