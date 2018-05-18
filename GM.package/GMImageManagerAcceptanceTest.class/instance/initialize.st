as yet unclassified
initialize
	self image: (GMImageManager instance
		loadAllResourcesFrom: 'testingResources/';
		getImageForm: GMImageManagerTest testImageName).