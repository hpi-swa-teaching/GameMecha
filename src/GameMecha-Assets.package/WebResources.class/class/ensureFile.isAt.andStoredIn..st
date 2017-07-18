as yet unclassified
ensureFile: url isAt: localPath andStoredIn: cache
	^ self ensureFile: url isAt: localPath andStoredIn: cache overwrite: false.