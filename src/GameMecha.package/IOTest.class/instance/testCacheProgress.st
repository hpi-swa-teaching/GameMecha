as yet unclassified
testCacheProgress
	|cache progressAfterFirstImage progressAfterSecondImage|
	cache := ImageCache newOn: 'GMTest'.

	self assert: (cache progress ) equals: 0.
	
	cache getTexture: 'sheet.png' andDo: [:form | progressAfterFirstImage := cache progress].
	self assert: (cache progress) equals: 0.
	cache getTexture: 'smile.png' andDo: [:form | progressAfterSecondImage := cache progress].
	self assert: (cache progress ) equals: 0.
	
	[progressAfterFirstImage isNil] "wait for the first image to load"
		whileTrue: [Processor yield].
	self assert: progressAfterFirstImage equals: (39487)/(39487 + 10382).
	
	[progressAfterSecondImage isNil] "wait for the second image to load"
		whileTrue: [Processor yield].
	self assert: progressAfterSecondImage equals: 1.