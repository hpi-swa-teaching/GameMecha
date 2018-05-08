testing
testAllOSsSupportSameKeys
	| windowsKeys macKeys unixKeys |
	windowsKeys := GmKeyHandler initializeKeyLookupWindows asSet.
	macKeys := GmKeyHandler initializeKeyLookupMac asSet.
	unixKeys := GmKeyHandler initializeKeyLookupLinux asSet.
	self assert: [windowsKeys = macKeys].
	self assert: [windowsKeys = unixKeys].