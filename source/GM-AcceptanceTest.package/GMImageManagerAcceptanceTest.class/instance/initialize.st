as yet unclassified
initialize
	| imageManager |
	imageManager := GMImageManager instance.
	imageManager loadAllResourcesFrom: 'testingResources/'.
	self image: (imageManager getImageForm: GMImageManagerTest testImageName).
	self abandon.