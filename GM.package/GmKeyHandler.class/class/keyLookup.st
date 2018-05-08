accessing
keyLookup
	^keyLookup ifNil: [keyLookup := self initializeKeyLookupOSIndependent. ^keyLookup ]