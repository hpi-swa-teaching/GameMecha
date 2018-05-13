testing
testImageCacheAcceptanceTest
	| imageMorph |
	imageMorph := ImageMorph new.
	imageMorph openInWorld.
	
	self cache flushCache.
	self cache loadAllResourcesFrom: ''.
	[5 timesRepeat: 
		[imageMorph image: (self cache getImageForm: #patrick).
		(Delay forSeconds: 0.5) wait.
		imageMorph image: (self cache getImageForm: #patrick2).
		(Delay forSeconds: 0.5) wait].
	imageMorph abandon] fork.
	