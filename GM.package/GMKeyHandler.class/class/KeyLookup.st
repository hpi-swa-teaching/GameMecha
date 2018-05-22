accessing
KeyLookup
	^ KeyLookup ifNil: [KeyLookup := self initializeKeyLookupOSIndependent]