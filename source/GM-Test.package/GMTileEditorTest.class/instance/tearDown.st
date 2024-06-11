as yet unclassified
tearDown
	(FileDirectory default fileExists: 'map.morph')
		ifTrue: [FileDirectory default deleteFileNamed: 'map.morph'].