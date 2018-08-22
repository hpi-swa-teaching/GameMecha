accessing
keyLookup
	^ KeyLookup ifNil: [KeyLookup := self initializeKeyLookupOSIndependent]