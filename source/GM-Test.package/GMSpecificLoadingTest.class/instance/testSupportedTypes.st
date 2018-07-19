as yet unclassified
testSupportedTypes
	self class supportedTypes do: [:type | 
		self assert: [self resourceManager isSupportedType: type] description: (type, ' is not supported')].