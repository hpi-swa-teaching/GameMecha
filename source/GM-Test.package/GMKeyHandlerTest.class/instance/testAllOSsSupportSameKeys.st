test cases
testAllOSsSupportSameKeys
	| windowsKeys macKeys unixKeys |
	windowsKeys := GMKeyHandler initializeKeyLookupWindows asSet.
	macKeys := GMKeyHandler initializeKeyLookupMac asSet.
	unixKeys := GMKeyHandler initializeKeyLookupLinux asSet.
	self assert: [windowsKeys = macKeys].
	self assert: [windowsKeys = unixKeys].