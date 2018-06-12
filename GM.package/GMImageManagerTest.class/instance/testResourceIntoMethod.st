testing
testResourceIntoMethod
	self should: [self resourceIntoMethodTarget] raise: Error.
	GMResourceLocator imageManager
		loadResourceIntoMethod: #resourceIntoMethodTarget 
		ofClass: self class 
		fromFile: TestResourceFixtures testImagePathPNG.
	self assert: [self class resourceIntoMethodTarget class = Form].
	self class class removeSelector: #resourceIntoMethodTarget.