testing
testImageCacheAcceptanceTest
	| imageMorph |
	imageMorph := ImageMorph new.
	"imageMorph openInWorld."
	
	self prepareTest.
	self imageManager loadAllResourcesFrom: 'testingResources/'.
	[2 timesRepeat: 
		[imageMorph image: (self imageManager getImageForm: GMImageManagerTest testImageName).
		(Delay forSeconds: 0.5) wait.
		imageMorph image: (self imageManager getImageForm: (GMImageManagerTest testImageAdditionalName)).
		(Delay forSeconds: 0.5) wait].
	imageMorph abandon] fork.
	