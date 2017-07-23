ensures
ensureFile: url isAt: localPath andStoredIn: cache overwrite: overwriteExisting 
	"returns, whether the file actually needed to get downloaded"
	((self fileExists: localPath)
			and: [overwriteExisting not])
		ifFalse: [self downloadFrom: url to: localPath andStoreIn: cache. ^ true].
	^ false.