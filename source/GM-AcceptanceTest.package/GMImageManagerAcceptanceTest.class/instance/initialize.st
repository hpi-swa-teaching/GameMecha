as yet unclassified
initialize
	super initialize.
	self image: (GMImageManager instance 
		loadAllResourcesFrom: 'testingResources/';
		getImageForm: GMImageManagerTest testImageName).
	self abandon.