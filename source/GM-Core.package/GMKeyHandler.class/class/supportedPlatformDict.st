key lookup
supportedPlatformDict
	^ (Dictionary newFrom: { 
		'Mac OS' -> [self initializeKeyLookupMac].
		'Win32' -> [self initializeKeyLookupWindows].
		'unix' -> [self initializeKeyLookupLinux ]})