as yet unclassified
testLoadResourceIntoMethod
	self executeIfLocal: 
		[self should: [self resourceIntoMethodTarget] raise: Error.
		self resourceManager
			loadResourceIntoMethod: #resourceIntoMethodTarget
			ofClass: self class
			fromFile: GMTestResourceFixtures testImagePathGIF.
		self class resourceIntoMethodTarget forms].