testing
testResourceIntoMethod
	self should: [self resourceIntoMethodTarget] raise: Error.
	GMResourceLocator imageManager
		loadResourceIntoMethod: #resourceIntoMethodTarget 
		ofClass: self class 
		fromFile: GMTestResourceFixtures testImagePathPNG.
	self assert: [self class resourceIntoMethodTarget isForm].