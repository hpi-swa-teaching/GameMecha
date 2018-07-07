as yet unclassified
ensureSlashEnding: aFoldername
	(aFoldername = '' or: [aFoldername endsWithAnyOf: {'/' . '\'}])
		ifTrue:  [^ ''].
	^ FileDirectory slash asString