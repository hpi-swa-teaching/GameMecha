*GameMecha-Assets-IO
importFileNamed: fullName
	
	(fullName endsWithAnyOf: (self class imageExtensions))
		ifTrue: [^ self importImageNamed: fullName].
	self error: 'Unknown file type: Cannot load ', fullName.