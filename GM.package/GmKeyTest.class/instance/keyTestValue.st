testing
keyTestValue
	^(Dictionary newFrom: {'Mac OS' -> 16r01. 'Win32' -> 16r53})
		at: Smalltalk os platformName ifAbsent: [self error: 'platform not supported']