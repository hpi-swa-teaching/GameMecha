testing
isAbstract
	^ super isAbstract or: [self name = #GMResourceLoadingTest]