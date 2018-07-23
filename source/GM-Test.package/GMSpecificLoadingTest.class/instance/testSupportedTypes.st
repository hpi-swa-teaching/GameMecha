test cases
testSupportedTypes
	self class supportedTypes do: [:type | 
		self assert: [self resourceManager isSupportedType: type] description: (type, ' should be supported')].