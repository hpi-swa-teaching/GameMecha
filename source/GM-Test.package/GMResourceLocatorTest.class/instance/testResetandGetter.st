as yet unclassified
testResetandGetter
	| temporaryManager |
	temporaryManager := GMImageLoader new.
	GMResourceLocator imageManager: temporaryManager.
	self assert: [temporaryManager == GMResourceLocator imageManager].
	GMResourceLocator resetImageManager.
	self assert: [temporaryManager ~~ GMResourceLocator imageManager].