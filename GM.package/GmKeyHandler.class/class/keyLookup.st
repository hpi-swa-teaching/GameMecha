accessing
keyLookup
	^keyLookup ifNil: 
		[Smalltalk os platformName =  'Mac OS' ifTrue: [self initializeKeyLookupMac].
		Smalltalk os platformName =  'Win32' ifTrue: [self initializeKeyLookupWindows]]