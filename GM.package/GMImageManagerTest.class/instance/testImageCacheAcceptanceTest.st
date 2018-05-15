testing
testImageCacheAcceptanceTest
	| imageMorph |
	imageMorph := ImageMorph new.
	imageMorph openInWorld.
	
	self prepareTest.
	self imageManager loadAllResourcesWithNamesFrom: '/testingResoures/'.
	[2 timesRepeat: 
		[imageMorph image: (self imageManager getImageForm: GMImageManagerTest testImageName).
		(Delay forSeconds: 0.5) wait.
		imageMorph image: (self imageManager getImageForm: (GMImageManagerTest testImageName , '2') asSymbol).
		(Delay forSeconds: 0.5) wait].
	imageMorph abandon] fork.
	