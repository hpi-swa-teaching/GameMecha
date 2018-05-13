testing
testImageCacheAcceptanceTest
	| imageMorph |
	imageMorph := ImageMorph new.
	imageMorph openInWorld.
	
	self prepareTest.
	self cache loadAllImagesFrom: ''.
	[5 timesRepeat: 
		[imageMorph image: (self cache getImageForm: GmImageCacheTest testImageName asSymbol).
		(Delay forSeconds: 0.5) wait.
		imageMorph image: (self cache getImageForm: (GmImageCacheTest testImageName , '2') asSymbol).
		(Delay forSeconds: 0.5) wait].
	imageMorph abandon] fork.
	