as yet unclassified
testResetandGetter
	| temporaryManager |
	temporaryManager := GMImageManager new.
	GMResourceLocator imageManager: temporaryManager.
	self assert: [temporaryManager == GMResourceLocator imageManager].
	GMResourceLocator resetImageManager.
	self assert: [temporaryManager ~~ GMResourceLocator imageManager].