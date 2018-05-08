testing
testSameNumberOfKeysOnAllSystems
	self assert: [GmKeyHandler initializeKeyLookupLinux size = GmKeyHandler initializeKeyLookupMac size].
	self assert: [GmKeyHandler initializeKeyLookupLinux size = GmKeyHandler initializeKeyLookupWindows size].