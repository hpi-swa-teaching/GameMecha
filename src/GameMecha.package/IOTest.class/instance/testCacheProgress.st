as yet unclassified
testCacheProgress
	|cache formCounter formCounterBlock |
	formCounter := 0.
	cache := ImageCache newOn: 'HOP'.
	formCounterBlock := [:tex | tex isForm ifTrue: [formCounter := formCounter + 1]].

	self assert: (cache progress ) equals: 0.
	
	cache getTexture: 'baum01.jpg' andDo: formCounterBlock.
	self assert: (cache progress) equals: 0.
	cache getTexture: 'baum02.jpg' andDo: formCounterBlock.

	self assert: (cache progress ) equals: 0.
	(Delay forMilliseconds: 1) wait.		
	self assert: (cache progress) equals: (4031826)/(3922310 + 4031826).
	(Delay forMilliseconds: 100) wait.		
	self assert: (cache progress) equals: 1.