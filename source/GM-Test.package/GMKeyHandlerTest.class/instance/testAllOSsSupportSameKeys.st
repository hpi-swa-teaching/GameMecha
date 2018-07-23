test cases
testAllOSsSupportSameKeys
	| windowsKeys macKeys unixKeys |
	windowsKeys := GMKeyHandler initializeKeyLookupWindows asSet.
	macKeys := GMKeyHandler initializeKeyLookupMac asSet.
	unixKeys := GMKeyHandler initializeKeyLookupLinux asSet.
	self assert: windowsKeys equals: macKeys.
	self assert: windowsKeys equals: unixKeys.