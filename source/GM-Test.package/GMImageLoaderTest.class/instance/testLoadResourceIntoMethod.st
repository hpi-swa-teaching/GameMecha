testing
testLoadResourceIntoMethod
	self should: [self class resourceIntoMethodTarget] raise: Error.
	self resourceManager
		loadResourceIntoMethod: #resourceIntoMethodTarget 
		ofClass: self class 
		fromFile: GMTestResourceFixtures testImagePathPNG.
	self assert: [self class resourceIntoMethodTarget isForm].