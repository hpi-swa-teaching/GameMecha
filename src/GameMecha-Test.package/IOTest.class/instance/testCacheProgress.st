as yet unclassified
testCacheProgress
	|progressAfterFirstImage progressAfterSecondImage|

	self assert: (Imports default loadingProgress) equals: 0.
	
	Imports default get: 'GMTest/sheet.png' andDo: [:form | progressAfterFirstImage := Imports default loadingProgress].
	self assert: (Imports default loadingProgress) equals: 0.
	Imports default get: 'GMTest/smile.png' andDo: [:form | progressAfterSecondImage := Imports default loadingProgress].
	self assert: (Imports default loadingProgress) equals: 0.
	
	[progressAfterFirstImage isNil] "wait for the first image to load"
		whileTrue: [Processor yield].
	self assert: progressAfterFirstImage equals: (39487)/(39487 + 10382).
	
	[progressAfterSecondImage isNil] "wait for the second image to load"
		whileTrue: [Processor yield].
	self assert: progressAfterSecondImage equals: 1.