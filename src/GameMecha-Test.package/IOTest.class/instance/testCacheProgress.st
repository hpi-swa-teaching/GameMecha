as yet unclassified
testCacheProgress
	|imports progressAfterFirstImage progressAfterSecondImage|
	imports := Imports new.
	self assert: (imports loadingProgress) equals: 0.
	
	imports get: 'GMTest/sheet.png' andDo: [:form | progressAfterFirstImage := imports loadingProgress].
	self assert: (imports loadingProgress) equals: 0.
	imports get: 'GMTest/smile.png' andDo: [:form | progressAfterSecondImage := imports loadingProgress].
	self assert: (imports loadingProgress) equals: 0.
	
	[progressAfterFirstImage isNil] "wait for the first image to load"
		whileTrue: [Processor yield].
	self assert: progressAfterFirstImage equals: (39487)/(39487 + 10382).
	
	[progressAfterSecondImage isNil] "wait for the second image to load"
		whileTrue: [Processor yield].
	self assert: progressAfterSecondImage equals: 1.