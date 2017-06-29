as yet unclassified
ensureFile: url isAt: localPath overwrite: overwriteExisting 
	"returns, whether the file actualle needed to get downloaded"
	((self fileExists: localPath)
			and: [overwriteExisting not])
		ifFalse: [self download: url to: localPath. ^ true].
	^ false.