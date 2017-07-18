as yet unclassified
ensureFile: url isAt: localPath overwrite: overwriteExisting 
	"returns, whether the file actualle needed to get downloaded"
	((self fileExists: localPath)
			and: [overwriteExisting not])
		ifFalse: [self downloadFrom: url to: localPath andStoreIn: nil. ^ true].
	^ false.