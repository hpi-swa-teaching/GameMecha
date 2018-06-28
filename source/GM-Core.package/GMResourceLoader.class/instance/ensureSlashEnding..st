as yet unclassified
ensureSlashEnding: aFoldername
	(aFoldername endsWithAnyOf: {'/' . '\'}) ifFalse: [^ aFoldername , FileDirectory slash].
	^ aFoldername