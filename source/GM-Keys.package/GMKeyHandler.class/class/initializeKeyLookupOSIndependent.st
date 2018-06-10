key lookup
initializeKeyLookupOSIndependent
	^ (self supportedPlatformDict at: (Smalltalk os platformName) ifAbsent: [self error: 'Platform not supported']) value