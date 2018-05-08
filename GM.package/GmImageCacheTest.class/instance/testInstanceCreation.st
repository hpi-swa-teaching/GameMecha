testing
testInstanceCreation
	self should: [GMImageCache new] raise: Error.
	GMImageCache instance.