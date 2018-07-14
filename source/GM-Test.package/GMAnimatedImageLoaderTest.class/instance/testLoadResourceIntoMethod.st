as yet unclassified
testLoadResourceIntoMethod
	self should: [self resourceIntoMethodTarget] raise: Error.
	self resourceManager
		storeResourceInMethod: #resourceIntoMethodTarget
		inInstance: self class
		fromFile: GMTestResourceFixtures testImagePathGIF.
	self assert: [self class class canUnderstand: #resourceIntoMethodTarget].
	self class resourceIntoMethodTarget forms; delays.