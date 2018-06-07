class initialization
initializeKeyLookupOSIndependent
	self flag: #todo. "cleanup implementieren sodass global state. klasse in startuplist einhängen startup:. clear cache"
	^ (self supportedPlatformDict at: (Smalltalk os platformName) ifAbsent: [self error: 'Platform not supported']) value