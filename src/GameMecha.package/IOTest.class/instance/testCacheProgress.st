as yet unclassified
testCacheProgress
	|cache progressAfterFirstImage progressAfterSecondImage|
	cache := ImageCache newOn: 'HOP'.

	self assert: (cache progress ) equals: 0.
	
	cache getTexture: 'baum01.jpg' andDo: [:form | progressAfterFirstImage := cache progress].
	self assert: (cache progress) equals: 0.
	cache getTexture: 'baum02.jpg' andDo: [:form | progressAfterSecondImage := cache progress].
	self assert: (cache progress ) equals: 0.
	
	[progressAfterFirstImage isNil]
		whileTrue: [Processor yield].
	self assert: progressAfterFirstImage equals: (4031826)/(3922310 + 4031826).
	[progressAfterSecondImage isNil]
		whileTrue: [Processor yield].
	self assert: progressAfterSecondImage equals: 1.